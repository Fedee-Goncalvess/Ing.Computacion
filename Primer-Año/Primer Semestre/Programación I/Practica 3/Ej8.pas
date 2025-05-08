
Program Ej8;
Function operador (car:char;num1,num2:integer): integer;
Begin
  Case (car) Of 
    '*': operador := num1*num2;
    '-': operador := num1-num2;
    '+': operador := num1+num2;
    '/': If (num2=0) Then operador := -1
         Else operador := num1 Div num2;
    Else
      operador := -1;
  End;
End;

Var 
  car: char;
  num1,num2: integer;
Begin
  writeln ('Introduzca un numero');
  Readln (num1);
  Writeln ('Introduzca una operador');
  Read (car);
  writeln ('Introduzca otro numero');
  Read (num2);
  write (operador(car,num1,num2));
  writeln (' ');
End.
