
Program Ej1;
Function potencia (i,n:integer): integer;

Var 
  producto,y: integer;
Begin
  producto := 1;
  For y:= (1) To (n) Do
    producto := producto*i;
  potencia := producto;
End;

Var 
  i,n: integer;
Begin
  writeln ('Introduzca un numero');
  read (i);
  writeln ('Introduzca la potencia');
  read (n);
  write (potencia(i,n));
End.
