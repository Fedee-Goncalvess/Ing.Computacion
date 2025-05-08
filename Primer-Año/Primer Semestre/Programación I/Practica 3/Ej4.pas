
Program Ej4;
Function capicua (num:integer): boolean;

Var 
  cifra,inv,num1: integer;
Begin
  inv := 0;
  num1 := num;
  While (num<>0) Do
    Begin
      cifra := num Mod 10;
      inv := inv*10 + cifra;
      num := num Div 10;
    End;
  If (inv=num1) Then
    capicua := true
  Else
    capicua := false;
End;

Var 
  num: integer;
Begin
  WriteLn ('Inserte un numero y compruebe si es capicua.');
  read (num);
  write (capicua(num));
  writeln (' ');
End.
