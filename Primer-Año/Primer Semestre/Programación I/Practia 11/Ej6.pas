
Program Ej6;

Type 
  cadena = string[20];

  cursos = array[1..10] Of integer;

  inscripto = Record
    dni: integer;
    apellido: cadena;
    nombre: cadena;
    edad: integer;
    cod: 1..10;
  End;

Procedure LeerInscripto (Var Alum:inscripto);
Begin
  writeln ('Introducir nombre');
  readln (Alum.nombre);
  If (alum.nombre<>'zzz') Then
    Begin
      writeln ('Introducir apellido');
      readln (alum.apellido);
      writeln ('Introducir dni');
      readln (alum.dni);
      writeln ('Introducir edad');
      readln (alum.edad);
      writeln ('Introducir clase (1-10)');
      readln (alum.cod);
    End;
End;

Procedure inscripcionAlumno (C:cursos; Alum:inscripto; Var Cant:cursos);
Begin
  If (C[Alum.cod]>Cant[Alum.cod]) Then
    Cant[Alum.cod] := Cant[Alum.cod]+1
  Else
    write ('No hay lugar disponible en el curso');
End;

Procedure CargarVector (Var Cant:cursos);

Var 
  i: integer;
Begin
  For i:=1 To 10 Do
    Begin
      Cant[i] := 0;
    End;
End;

Procedure CargarCursos (Var C:cursos);

Var 
  i: integer;
Begin
  For i:=1 To 10 Do
    Begin
      C[i] := 7;
    End;
End;


Procedure InformarCupos (Cant:cursos;C:cursos);

Var 
  i: integer;
Begin
  For i:= 1 To 10 Do
    Begin
      If (Cant[i]<C[i]) Then
        Write ('El curso num ',i,' no se completo');
    End;
End;

Var 
  alum: inscripto;
  C: cursos;
  Cant: cursos;
  Curso2: integer;
Begin
  Curso2 := 0;
  CargarCursos (C);
  CargarVector (Cant);
  LeerInscripto(alum);
  While (alum.nombre<>'zzz') Do
    Begin
      If (alum.cod=2) And (alum.edad>=35) And (alum.edad<=30) Then
        Curso2 := Curso2+1;
      inscripcionAlumno(C,alum,cant);
      LeerInscripto(alum);
    End;
  InformarCupos(Cant,C);
  write ('Se inscribieron ',Curso2, ' alumnos entre 30 y 35 años al curso 2');
End.
