
Program Ej_1;

Const 
  C = 5;

Type 
  numeros = array [1..C] Of integer;

Procedure Cargar (Var v:numeros);

Var 
  i: integer;

Begin
  For i:= 1 To C Do
    Begin
      write ('Introducir Numero');
      read (V[i]);
    End;
End;

Procedure Promedio (Var v:numeros; Var prom:integer; Var posit:integer; Var
                    negat
                    :integer);

Var 
  tot,i: integer;

Begin
  tot := 0;
  For i:=1 To C Do
    Begin
      tot := tot + V[i];
      If (V[i]>=0) Then
        posit := posit+1
      Else
        negat := negat+1;
    End;
  prom := tot Div C;
  negat := 100*negat Div C;
  posit := 100 * posit Div C;
End;

Procedure Rango (Var v:numeros; num1:integer; num2:integer; Var cant:integer);

Var 
  i: integer;
Begin
  cant := 0;
  If (num1>num2) Then
    Begin
      For i:=1 To C Do
        If (V[i]>num2) And (V[i]<num1) Then
          cant := cant+1;
    End
  Else
    For i:=1 To C Do
      If (V[i]>num1) And (V[i]<num2) Then
        cant := cant+1;
End;

Procedure maximos (Var v:numeros; Var max1,max2,pos1,pos2:integer);

Var 
  i: integer;

Begin
  max1 := -99;
  For i:=1 To C Do
    If (V[i]>max1) Then
      Begin
        max2 := max1;
        max1 := V[i];
        pos2 := pos1;
        pos1 := i;
      End
    Else
      If (V[i]>max2) Then
        Begin
          max2 := V[i];
          pos2 := i;
        End;
End;


Var 
  num: integer;
  prom,posit,negat: integer;
  V: numeros;
  Rmin,Rmax,max1,max2,pos1,pos2,cant: integer;
Begin
  Cargar (V);
  prom := 0;
  posit := 0;
  negat := 0;
  promedio (V,prom,posit,negat);
  read (Rmin,Rmax);
  Rango(V,Rmin,Rmax,cant);
  maximos(V,max1,max2,pos1,pos2);
  write ('Promedio es: ',prom, '  numeros positivos: ',posit,
         ' numeros negativos: ', negat,
         ' cantidad de numeros en el rango desde ',Rmin,' hasta ',Rmax,
         ' es de: ',cant,' Los dos valores maximos son: ',max1,' en posicion ',
         pos1, ' y el segundo: ',max2, ' en posicion ', pos2);
End.
