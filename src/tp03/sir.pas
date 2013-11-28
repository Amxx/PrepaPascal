PROGRAM SIR (input, output);

VAR	
	path :		STRING;
	
	idx : 		INTEGER;
	t : 			REAL;
	dt :			REAL;
	
	p : 			REAL;
	a : 			REAL;
	
	S : 			REAL;
	I : 			REAL;
	R : 			REAL;
	
	
PROCEDURE step();
VAR
	newS : REAL;
	newI : REAL;
	newR : REAL;
BEGIN
	newS := S - p*S*I*dt;
	newI := I + p*S*I*dt - a*I*dt;
	newR := R + a*I*dt;
	
	S := newS;
	I := newI;
	R := newR;
END;


BEGIN
	writeln(stderr, '====== Simulation modele SIR ======');
	writeln(stderr, 'Fichier en sortie :    '); read(path);
	writeln(stderr, 'Temps de simultation : '); read(t);
	writeln(stderr, 'Pas de temps :         '); read(dt);
	writeln(stderr, 'P value :              '); read(p);
	writeln(stderr, 'A value :              '); read(a);
	
	if (path <> '') then begin assign(stdout, path); rewrite(stdout); end;
	
	S := 0.999;
	I := 0.001;
	R := 0.;
	
	idx := 0;
	while idx <= trunc(t/dt) do
	//while S+I >= 0.01 do
		begin
			step();
			writeln(stdout, idx*dt, ' ', S, ' ', I, ' ', R);
			idx := idx+1
		end;
END.