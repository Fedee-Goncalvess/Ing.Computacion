
Program Ej2b;
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
  m,n,comb: Integer;
Begin
  writeln ('Ingrese numero m');
  read (m);
  writeln ('Ingrese numero n');
  read (n);
  comb := factorial(m) Div (factorial(m-n)*factorial(n));
  writeln ('El numero combinatorio es: ',comb);
End.
