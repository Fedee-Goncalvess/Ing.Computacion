
Program Ej_uno_c;
{Al meter un numero de 6 digitos da un resultado erroneo}

Var 
  i,num,aux: integer;
Begin
  For i:= 1 To 5 Do {Se introducen numeros 5 veces}
    Begin
      writeln ('Introduzca un numero entero');
      read (num); {Introducir un entero}
      While (num <> 0) Do {Procesara cada cifra hasta que le de 0}
        Begin
          aux := num Mod 10;
          If (aux Mod 2 =0) Then
            Begin
              Writeln ('El digito ',aux,' es par');
              Writeln ('  ');{Espacio para ver mejor el codigo}
            End;
          num := num Div 10;
        End;
    End;
End.
