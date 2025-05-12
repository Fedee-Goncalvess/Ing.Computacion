
Program Ej_uno_b;
{Al meter un numero de 6 digitos da un resultado erroneo}

Var 
  num,aux,max: integer;
Begin
  max := -1;
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
      If (aux>max) Then {Se toma el valor maximo}
        max := aux;
      num := num Div 10;
    End;
  Writeln ('El digito mas grande encontrado fue ',max);
End.
