PROGRAM bonjour (output);

CONST
	message1 = 'salut, ça va ?';  
	message2 = 'moi ça baigne';  


FUNCTION Maintenant : string;
begin
  //Maintenant := DateTimeToString()
end;


PROCEDURE writestring(str : STRING);
BEGIN
  writeln(str)
END;


BEGIN  
	writestring(message1);
	writestring(message2)
END. 

