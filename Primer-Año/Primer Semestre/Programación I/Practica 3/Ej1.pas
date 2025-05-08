
Program Ej1;
Function 
minimo (num:integer): Integer;

Var 
  cifra, min : integer;
Begin
  min := 10;
  While (num<>0) Do
    Begin
      cifra := num Mod 10;
      If (cifra<min) Then
        Begin
          min := cifra;
        End;
      num := num Div 10;
    End;
  minimo := min;
End;

Var 
  num: integer;
Begin
  WriteLn ('Introducir Numero');
  read (num);
  Write ('El numero mas chico es: ');
  write (minimo(num));
  writeln (' ')
End.
