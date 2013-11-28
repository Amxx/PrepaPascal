PROGRAM minmax(input, output);

VAR
	a : integer;
	b : integer;


FUNCTION min(i:integer; j:integer):integer;
BEGIN
	if i<j then min := i else min := j
END;

FUNCTION max(i:integer; j:integer):integer;
BEGIN
	if i>j then max := i else max := j
END;


BEGIN
	write('nombre 1: ');
	readln(a);
	write('nombre 2: ');
	readln(b);
	writeln('min : ', min(a,b), ', max : ', max(a,b));
END.
