
Program Ej3b;
Function max (n1,n2:integer): integer;
Begin
  If (n1>n2) Then
    max := n1
  Else
    max := n2;
End;

Function max4 (num1,num2,num3,num4:integer): integer;
Begin
  max4 := max(max (num1,num2) , max (num3,num4) );
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
  write (max4 (num1,num2,num3,num4) );
  WriteLn (' ')
End.
