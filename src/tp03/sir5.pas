PROGRAM SIR (input, output);

VAR	
	path :		STRING;
	
	idx : 		INTEGER;
	t : 			REAL;
	dt :			REAL;
	
	p : 			REAL;
	l :				REAL;
	a : 			REAL;
	m :				REAL;
	
	S : 			REAL;
	E :				REAL;
	I : 			REAL;
	R : 			REAL;
	D :				REAL;
	
	
PROCEDURE step();
VAR
	newS : REAL;
	newE : REAL;
	newI : REAL;
	newR : REAL;
	newD : REAL;
BEGIN
	newS := S - p*S*(E+I)*dt;
	newE := E + p*S*(E+I)*dt - l*E*dt;
	newI := I + l*E*dt - a*I*dt - m*I*dt;
	newR := R + a*I*dt;
	newD := D + m*I*dt;
	
	S := newS;
	E := newE;
	I := newI;
	R := newR;
	D := newD;
END;


BEGIN
	writeln(stderr, '====== Simulation modele SIR ======');
	writeln(stderr, 'Fichier en sortie :    '); read(path);
	writeln(stderr, 'Temps de simultation : '); read(t);
	writeln(stderr, 'Pas de temps :         '); read(dt);
	writeln(stderr, 'P value :              '); read(p);
	writeln(stderr, 'L value :              '); read(l);
	writeln(stderr, 'A value :              '); read(a);
	writeln(stderr, 'M value :              '); read(m);

	if (path <> '') then begin assign(stdout, path); rewrite(stdout); end;
	
	S := 0.999;
	E := 0.;
	I := 0.001;
	R := 0.;
	D := 0.;
	
	idx := 0;
	while idx <= trunc(t/dt) do
	//while S+E+I >= 0.01 do
		begin
			step();
			writeln(stdout, idx*dt, ' ', S, ' ', E, ' ', I, ' ', R, ' ', D);
			idx := idx+1
		end;
END.