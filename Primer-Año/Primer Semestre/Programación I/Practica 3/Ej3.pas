
Program Ej3;
Function 
max4 (num1,num2,num3,num4:integer): integer;

Var 
  max: integer;
Begin
  If (num1>num2) Then
    max := num1
  Else
    max := num2;
  If (num3>num4)Then
    max := num3;
  If (num4>max) Then
    max := num4;
  max4 := max;
End;

Var 
  num1,num2,num3,num4: integer;
Begin
  WriteLn ('Inserte 4 numeros enteros');
  read (num1);
  read (num2);
  read (num3);
  read (num4);
  Write ('El numero mas grande es= ');
  write (max4(num1,num2,num3,num4));
  WriteLn (' ')
End.
