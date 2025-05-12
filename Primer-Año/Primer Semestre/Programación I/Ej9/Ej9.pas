
Program Ej9;

Var 
  i,alum,materias,nalum,proalum,maxalum: Integer;
  nota,totnota,maxnota,promedio,maxpro: Real;
Begin
  alum := 0;
  totnota := 0;
  maxnota := -1;
  maxpro := -1;
  maxalum := 0;
  While (alum<5) Do
    Begin
      alum := alum+1;
      WriteLn ('Numero del alumno');
      ReadLn (nalum);
      WriteLn('Cantidad de materias');
      ReadLn (materias);
      For i:=(1) To (materias) Do
        Begin
          WriteLn ('Nota del alumno');
          ReadLn (nota);
          totnota := totnota + nota;
          If (maxnota<nota) Then
            Begin
              maxnota := nota;
              maxalum := nalum;
            End;
        End;
      promedio := totnota / materias;
      If (promedio>maxpro) Then
        Begin
          maxpro := promedio;
          proalum := nalum;
        End;

    End;
  WriteLn ('La nota mas alta del alumno ',maxalum);
  WriteLn ('es de ', maxnota:2:2);
  WriteLn ('EL alumno con el promedio mas alto es ',proalum);
End.
