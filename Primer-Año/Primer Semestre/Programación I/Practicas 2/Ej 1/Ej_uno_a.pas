
Program Ej_uno_a;
{Al meter un numero de 6 digitos da un resultado erroneo}

Var 
  num,aux: integer;
Begin
  writeln ('Introduzca un numero entero');
  read (num); {Introducir un entero}
  While (num <> 0) Do {Procesara cada cifra hasta que le de 0}
    Begin
      aux := num Mod 10;
      If (aux Mod 3 =0) Then
        Begin
          Writeln ('El digito ',aux,' es multiplo de 3');
          Writeln ('  ');{Espacio para ver mejor el codigo}
        End;
      num := num Div 10;
    End;
End.
