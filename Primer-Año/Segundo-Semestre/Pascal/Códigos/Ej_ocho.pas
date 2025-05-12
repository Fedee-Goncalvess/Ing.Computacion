
Program Ej_ocho;

Var 
  cant_car,cantP,rpal: integer;
  car: char;
Begin
  cant_car := 0;
  cantP := 0;
  rpal := 0;
  writeln ('Escriba una oracion.');
  read (car);
  {----------while puedo sacarlo-----------}

  Repeat
    cant_car := cant_car+1;

{-------------------------------}

    If (car= 'R') Then
      Begin
        While (car<>' ') And (car<> 'Z') And (cant_car>500) Do
          Begin
            ReadLn (car);
            cant_car := cant_car+1;
          End;
        rpal := rpal+1
      End;
{--------------------------------}
    If (car=' ') Then
      Begin
        While (car=' ') Do
          Begin
            readln (car);
          End;
        cantP := cantP+1
      End;
    read (car)
  Until (cant_car=500) Or (car='Z');
  Writeln ('La cantidad de palabras son ',cantP)
End.
