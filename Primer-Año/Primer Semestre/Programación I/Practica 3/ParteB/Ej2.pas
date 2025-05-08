
Program Ej2;
Function factorial (n:Integer): integer;

Var 
  i,m: Integer;

Begin
  m := n-1;
  For i:= (1) To (m) Do
    n := n*i;
  factorial := n;
End;

Var 
  n: integer;
Begin
  WriteLn ('introduzca un numero');
  read (n);
  WriteLn (factorial(n));
  writeln (' ');
End.
