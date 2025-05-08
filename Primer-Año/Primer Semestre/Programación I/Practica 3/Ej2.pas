
Program Ej2;

Function 
modulo (num, divisor:integer): integer;

Var 
  cifra: integer;
Begin
  cifra := num Div divisor;
  cifra := cifra * divisor;
  cifra := num - cifra;
  modulo := cifra;
End;

Var 
  num,divisor: integer;
Begin
  WriteLn ('Insertar un numero entero');
  read (num);
  writeln ('Insertar un numero distinto a 0');
  read (divisor);
  write ('El resto de ',num,' dividido ',divisor, ' es= ');
  write (modulo(num,divisor));
  writeln (' ')
End.
