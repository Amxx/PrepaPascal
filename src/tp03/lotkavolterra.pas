PROGRAM SIR (input, output);

VAR	
	path :		STRING;
	
	idx : 		INTEGER;
	t : 			REAL;
	dt :			REAL;
	
	a : 			REAL;
	
	X : 			REAL;
	Y : 			REAL;
	
	
PROCEDURE step();
VAR
	newX : REAL;
	newY : REAL;
BEGIN
	newX := (1+dt)*X - X*Y*dt;
	newY := (1-dt)*Y + a*X*Y*dt;
	X := newX;
	Y := newY;
END;


BEGIN
	writeln(stderr, '====== Simulation modele SIR ======');
	writeln(stderr, 'Fichier en sortie :    '); read(path);
	writeln(stderr, 'Temps de simultation : '); read(t);
	writeln(stderr, 'Pas de temps :         '); read(dt);
	writeln(stderr, 'alpha :                '); read(a);
	
	if (path <> '') then begin assign(stdout, path); rewrite(stdout); end;
	
	X := 1;
	Y := 1;
	
	idx := 0;
	while idx <= trunc(t/dt) do
		begin
			step();
			writeln(stdout, idx*dt, ' ', X, ' ', Y);
			idx := idx+1
		end;
END.