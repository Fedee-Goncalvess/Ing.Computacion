
Program Ej_8;

Type 
  Examen = Record
    nombre: string [15];
    continente: string [15];
    puntaje: 0..100;
  End;

Procedure leerExamen (Var dato:Examen);
Begin
  writeln ('Introducir nombre');
  readln (dato.nombre);
  If (dato.nombre <> 'zzz') Then
    Begin
      writeln ('Introducir continente');
      readln (dato.continente);
      writeln ('Introducir puntaje');
      readln (dato.puntaje);
    End
  Else
    Begin
      dato.continente := 'x';
      dato.puntaje := 0;
    End;
End;

Procedure maxPuntaje (dato:Examen; Var maxP:integer; Var Pmax:String);
Begin
  If (dato.puntaje>maxP)Then
    Begin
      maxP := dato.puntaje;
      Pmax := dato.nombre
    End;
End;

Procedure aprobado (dato:Examen; Var Ap:integer; Var Pr:integer);
Begin
  If (dato.puntaje>=90) Then
    Pr := Pr+1
  Else
    If (dato.puntaje>=70) Then
      Ap := Ap+1;
End;

Procedure promedio (dato:Examen;Var prom:integer;Var contE:integer );
Begin
  If (dato.continente = 'Europa') Then
    Begin
      prom := prom+dato.puntaje;
      contE := contE+1;
    End;
End;

Var 
  i,maxP,Ap,Pr,Prom,contE: integer;
  Pmax: string [15];
  dato: Examen;
  continente: string;

Begin
  maxP := -1;
  For i := 1 To 3 Do
    Begin

      contE := 0;
      Ap := 0;
      Pr := 0;
      leerExamen (dato);
      While (dato.nombre <>'zzz') Do
        Begin
          continente := dato.continente;
          maxPuntaje (dato,maxP,Pmax);
          aprobado (dato, Ap, Pr);
          promedio (dato,prom,contE);
          leerExamen (dato);
        End;
      writeln ('Los aprobados fueron: ',Ap, ' y los Promocionados fueron: ',Pr);
      If (continente = 'Europa') Then
        Begin
          prom := prom Div contE;
          writeln ('El promedio de puntaje de Europa fue de: ', prom);
        End;
    End;
  writeln ('El puntaje maximo fue de ',Pmax, ' con: ',maxP, ' puntos.')
End.
