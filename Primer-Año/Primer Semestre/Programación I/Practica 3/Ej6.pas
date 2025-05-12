
Program Ej6;

Function palabras (car:char): integer;

Var 
  pal,cant: integer;
Begin
  cant := 0;
  pal := 0;
  While (car=' ') Do
    Begin
      Read (car);
    End;
  While (car<> '*') Do
    Begin
      While (car<>'*') And (car<> ' ') Do
        Begin
          cant := cant+1;
          If (cant=7) Then
            Begin
              cant := 0;
              pal := pal+1;
            End;
          read (car);
        End;
      cant := 0;
      While (car=' ') Do
        Begin
          read (car);
        End;
    End;
  palabras := pal;
End;

Var 
  car: Char;
Begin
  writeln ('Introduzca una oracion');
  read (car);
  write (palabras(car));
  writeln (' ');
End.
