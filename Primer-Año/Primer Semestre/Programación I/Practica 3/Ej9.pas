
Program Ej9;
Procedure proceso (car:char);

Var 
  ant: char;
  cant: integer;
Begin
  cant := 0;
  While (car<> '.') And (car<>' ') Do
    Begin
      ant := car;
      Read (car);
      If (ant='a') And (car='p') Then
        Begin
          cant := cant+1;
          While (car<> '.') And (car<>' ') Do
            Begin
              read (car)
            End;

        End;
      While (car=' ') Do
        Begin
          Read (car);
        End;
    End;
  write ('Cantidad de ap: ', cant);
End;

Var 
  car: char;
Begin
  writeln ('intrducir palabras');
  Read (car);
  While (car=' ') Do
    Begin
      Read (car);
    End;
  If (car<>'.') Then
    proceso(car);

  writeln (' ');
End.
