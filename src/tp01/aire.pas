PROGRAM cercle(output);

CONST 
	PI = 3.1415926535897932384626;
	
VAR
	rayon : REAL;
	

FUNCTION aire(var r:REAL):REAL;
BEGIN
	aire := PI*r*r;
END;

FUNCTION perimetre(var r:REAL):REAL;
BEGIN
	perimetre := 2.*PI*r;
END;


BEGIN
	readln(rayon);
	writeln(rayon, '->', perimetre(rayon), ',', aire(rayon));
	
END.


