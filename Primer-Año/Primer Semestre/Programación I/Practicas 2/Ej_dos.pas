
Program Ej_dos;

Var 
  max1,max2,num,suma,cifra: integer;
Begin
  suma := 0;
  writeln ('Insertar numero entero');
  read (num);
  While (num<>9999){num procesados <> 9999} Do
    Begin
      max1 := -1;
      cifra := num Mod 10;
      suma := suma + cifra ;
      While (num<>0) Do
        Begin
          cifra := num Mod 10;
          If (cifra>max1) Then
            Begin
              max2 := max1;
              max1 := cifra;
            End
          Else
            If (cifra>max2) Then
              Begin
                max2 := cifra;
              End;
          num := num Div 10;
        End;
      If (max2 <> -1)Then
        Begin
          writeln ('Los digitos mayores del numero son ', max1,' y ' ,max2);
        End
      Else
        writeln ('El digito mayor es su mismo digito, ',max1);
      writeln ('Insertar numero entero');
      Read (num);
    End;
  writeln ('La suma de las unidades es ',suma);
End.
