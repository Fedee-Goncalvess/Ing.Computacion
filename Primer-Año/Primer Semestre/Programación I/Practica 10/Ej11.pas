
Program Ej11;

Type 
  horas = Record
    minutos: 0..60;
    segundos: 0..59;
  End;

  Lista = ^nodo;
  nodo = Record
    dato: horas;
    sig: Lista;
  End;

  sujeto = Record
    nombre: string[15];
    apellido: string[15];
    genero: string[15];
    tiempo: Lista;
  End;

  maratonistas = array [1..50] Of sujeto;


Procedure promedioTiempo (L:Lista);
Begin
  write (promedioMins);
  write (promedioSeg);
End;

Procedure CargarLista (Var L:Lista;T:tiempo);

Var 
  nue: Lista;
Begin
  New(nue);
  nue^.dato := T;
  nue^.sig := L;
  L := nue;
End;

Procedure CargarTiempo (Var L:Lista);

Var 
  T: horas;
Begin
  read (T.minutos);
  While (T.minutos >=0) Do
    Begin
      read(T.segundos);
      CargarLista(L,T);
      read (T.minutos);
    End;
End;

Procedure CargarSujeto (Var V:sujeto);
Begin
  read(V.nombre);
  read(V.apellido);
  read(V.genero);
  CargarTiempo(V.tiempo);
  promedioTiempo (V.tiempo); {¿function o procedure?}
End;

Procedure Cargar50Sujetos (Var V:maratonistas);

Var 
  i: integer;
Begin
  For i:=1 To 50 Do
    CargarSujeto(V[i]);
End;

Procedure InformarMejorTiempo (L:Lista);

Var 
  max: horas;
Begin
  max.minutos := -0;
  max.segundos := 0;
  While (L<>Nil) Do
    Begin
      If (max.minutos<L^.dato.minutos) Then
        Begin
          max.minutos := L^.dato.minutos;
          max.segundos := L^.dato.segundos;
        End
      Else
        If (max.minutos=L^.dato.minutos) And (max.segundos<L^.dato.segundos)
          Then
          Begin
            max.minutos := L^.dato.minutos;
            max.segundos := L^.dato.segundos;
          End;
      L := L^.sig;
    End;
  write ('Su mejor tiempo fue de ',max.minutos,':',max.segundos);
End;

Var 
  V: maratonistas;
Begin
  Cargar50Sujetos(V);
  For i:= 1 To 50 Do
    InformarMejorTiempo(V[i].tiempo);
End.
