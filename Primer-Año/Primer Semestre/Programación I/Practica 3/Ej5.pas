
Program Ej5;
Function digitos (num,cant:integer): integer;

Var 
  cifra,inv,i: integer;
Begin
  inv := 0;
  For i:= (1) To (cant) Do
    Begin
      cifra := num Mod 10;
      inv := inv*10 + cifra;
      num := num Div 10;
    End;
  digitos := inv;
End;

Var 
  num,cant: integer;
Begin
  Writeln ('Ingrese un numero');
  read (num);
  WriteLn ('Cantidad de digitos a imprimir');
  read (cant);
  write (digitos(num,cant));
  writeln (' ');
End.
