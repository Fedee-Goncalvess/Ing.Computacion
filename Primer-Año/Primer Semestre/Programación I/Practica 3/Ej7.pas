
Program Ej7;
Function promedio (cant:integer): integer;

Var 
  total,edad,i: integer;
Begin
  total := 0;
  For i:= (1) To (cant) Do
    Begin
      writeln ('Introduzca la edad de una persona');
      read (edad);
      total := total+edad;
    End;
  promedio := total Div cant;

End;

Var 
  cant: integer;
  pro: integer;
Begin
  WriteLn ('Introduzca un numero de personas');
  read (cant);
  pro := (promedio(cant));
  writeln (' ');
  writeln ('El promedio de la edad de ',cant, ' personas es de: ', pro);
End.
