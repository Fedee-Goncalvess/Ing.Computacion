
Program Ej5;

Type 
  abc = set Of char;
Procedure palabra (car:char);

Var 
  consonantes: abc;
  vocales: abc;
  voc,cons: integer;
Begin
  voc := 0;
  cons := 0;
  vocales := ['a','e','i','o','u','A','E', 'I', 'O',
             'U'];
  consonantes := ['a'..'z'] + ['A'..'Z']-vocales;
  While (car<>'*') And (car<>' ') Do
    Begin
      If (car In consonantes) Then
        cons := cons+1;
      If (car In vocales) Then
        voc := voc+1;
      read (car);
    End;
  writeln ('La cantidad de vocales son: ',voc,
           ' y la cantidad de consonantes son: ', cons);
End;

Var 
  car: char;
Begin
  WriteLn ('Introduzca una palabra a analizar');
  read (car);
  palabra (car);
End.
