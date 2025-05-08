
Program Ej_uno_e;
{Al meter un numero de 6 digitos da un resultado erroneo}

Var 
  cant,num,aux: integer;
Begin
  cant := 0;{inicializo las veces que se procesan digitos antes del repeat}
    {para que no se inicializen siempre en 0}

  Repeat
    writeln ('Introduzca un numero entero');
    read (num); {Introducir un entero}
    While (num <> 0) Do {Procesara cada cifra hasta que le de 0}
      Begin
        aux := num Mod 10;
        cant := cant + 1;
        If (aux Mod 3 =0) Then
          Begin
            Writeln ('El digito ',aux,' es multiplo de 3');
            Writeln ('  ');{Espacio para ver mejor el codigo}
          End;
        num := num Div 10;
      End;
  Until (cant>15){como minimo 15 digitos, si usas = puede entrar en loop}
End.
