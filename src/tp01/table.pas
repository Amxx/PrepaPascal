PROGRAM tableau(output);

CONST
	SIZE = 		10;
	MAX_INT =	100;

VAR
	table : array[0..SIZE] of integer;
	i : integer;






PROCEDURE randomize_table(var table : array of integer; size : integer);
VAR 
	i : integer;
BEGIN
	for i := 0 to size do
		table[i] := random(MAX_INT);
END;
	
	
	
	
	
	
PROCEDURE display_table(table : array of integer; size : integer);
VAR
	i : integer;
BEGIN
	write('(');
	for i := 0 to size-1 do
		write(table[i], ',');
	writeln(table[size], ')');
END;
	
	
	
	
	
FUNCTION min_table(table : array of integer; size : integer) : integer;
VAR
	i, r : integer;
BEGIN
	r := table[0];
	for i := 1 to size do
		if r > table[i] then
			r := table[i];
	min_table := r;
END;

		
FUNCTION rmax_table(table : array of integer; size : integer) : integer;
VAR
	i, j : integer;
BEGIN
	j := 0;
	for i := 1 to size do
		if table[j] < table[i] then
			j := i;
	rmax_table := j;
END;

		
PROCEDURE swap(var i : integer; var j : integer);
VAR
	t : integer;
BEGIN
	t := i;
	i := j;
	j := t;
END;
		
PROCEDURE selectionsort_table(var table : array of integer; size : integer);
VAR
	i : integer;
BEGIN
	for i := size downto 1 do
		swap(table[i], table[rmax_table(table, i)]);
END;

PROCEDURE quicksort_table(var table : array of integer; a : integer; b : integer);
VAR
	p : integer;
	i : integer;
BEGIN
	if (a < b) then
		begin
			p := a;
			for i := a+1 to b do
				if table[i] < table[a] then
					begin
						p := p+1;
						swap(table[i], table[p]);
					end;
			swap(table[a], table[p]);
			quicksort_table(table, a, p-1);
			quicksort_table(table, p+1, b);
		end;
END;

		
		
		
BEGIN
	for i := 0 to SIZE do
		table[i] := 0;

	randomize();
	
	display_table(table, SIZE);
	randomize_table(table, SIZE);
	display_table(table, SIZE);
	
	// selectionsort_table(table, SIZE);
	
	quicksort_table(table, 0, SIZE);
	display_table(table, SIZE);
	
END.
