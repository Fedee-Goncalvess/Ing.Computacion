
Program Ej5b;
Function digitos (num:integer): integer;

Var 
  cant,cifra,inv,i: integer;
Begin
  inv := 0;
  If (num>=10000) Then
    cant := 5
  Else
    cant := 3;
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

  While (num<>0) Do
    Begin
      write (digitos(num));
      writeln (' ');
      Writeln ('Ingrese un numero');
      read (num);
    End;

End.
