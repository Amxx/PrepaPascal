PROGRAM test (output);


var
	i : integer;
	perimetre : real;

PROCEDURE afficheperimetre(rayon : real);
var
	perimetre : real;
begin
	perimetre := 2 * 3.14159 * rayon;
	writeln(perimetre);
end;


BEGIN  
	for i := 0 to 100 do
		afficheperimetre(real(i));
END. 

