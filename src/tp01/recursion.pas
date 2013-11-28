PROGRAM recursion(output);


FUNCTION fact(n : integer) : integer;
BEGIN
	if n = 0 then
		fact := 1
	else
		fact := n * fact(n-1);
END;

FUNCTION fact_long(n : longint) : longint;
BEGIN
	if n = 0 then
		fact_long := 1
	else
		fact_long := n * fact_long(n-1);
END;

	
	
	
	
FUNCTION fibo_naif(n : integer) : longint;
BEGIN
	if n = 0 then
		fibo_naif := 0
	else if n = 1 then 
		fibo_naif := 1
	else
		fibo_naif := fibo_naif(n-1) + fibo_naif(n-2);
END;

FUNCTION fibo_memory(n : integer; var memory : array of longint) : longint;
BEGIN
	if n = 0 then 
		memory[n] := 0
	else if n = 1 then
		memory[n] := 1
	else if memory[n] = -1 then
		memory[n] := fibo_memory(n-1, memory) + fibo_memory(n-2, memory);
	
	fibo_memory := memory[n];
END;

	
	
	
	
VAR
	i : 			integer;
	memory :	array[0..100] of longint;
	
BEGIN
	// Initialisation du tableau memoire
	for i := 0 to 100 do
		memory[i] := -1;

	
	
	// Calcul de la factoriel sur des entiers simple et des entiers doubles
	for i := 0 to 20 do
		writeln('fact (', i, ') : ', fact(i), ',	', fact_long(i));
	


	// Calcul de la suite de fibonnaci par la methode naive
	for i := 0 to 42 do
		writeln('fibo (', i, ') : ', fibo_naif(i));
	
	// Calcul de la suite de fibonnaci avec un tableau memoire
	for i := 0 to 100 do
		writeln('fibo_memory (', i, ') : ', fibo_memory(i, memory));
	
END.