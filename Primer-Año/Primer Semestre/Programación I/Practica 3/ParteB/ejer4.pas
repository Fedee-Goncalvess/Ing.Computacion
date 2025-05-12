
Program ejer4;

Type 
  letras = set Of char;

Procedure imprimirLetras(abc: letras);

Var 
  i: char;
Begin
  For i:= 'a' To 'z' Do
    Begin
      If (i In abc) Then
        write(i);
    End;
End;

Procedure procesarSecuencia(Var abc: letras);

Var 
  car: char;
Procedure descartarBlancos (Var car:char);
Begin
  While (car = ' ') Do
    read(car);
End;
Begin
  read(car);
  descartarBlancos(car);
  While (car <> '#') And (car <> ' ') Do
    Begin
      If (car In abc) Then
        abc := abc - [car];
      read(car)
    End;
  imprimirLetras(abc);
End;

Var 
  abc: letras;

Begin
  abc := ['a'..'z'];
  procesarSecuencia(abc);
End.
