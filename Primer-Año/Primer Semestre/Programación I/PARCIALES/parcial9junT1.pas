
Program parcial9junT1;

Const 
  PART = 135;

Type 
  cadenaNombre = string[20];

  calendario = Record
    dia: 1..30;
    mes: 1..12;
    año: 2020..2025;
  End;

  partido = Record
    nombre: cadenaNombre;
    vac: integer;
  End;
  partidos = array[1..PART] Of partido;

  vacunacion = Record
    fecha: calendario;
    codPartido: 1..135;
    codZona: 1..5;
    cantVac: integer;
  End;

  lista = ^nodo;
  nodo = Record
    dato: vacunacion;
    sig: lista;
  End;

  min = Record
    nom1: cadenaNombre;
    cant1: integer;
    nom2: cadenaNombre;
    cant2: integer;
  End;

  Listas = array[1..5] Of Listas;


Procedure InicializarMin (Var M:min);
Begin
  M.nom1 := ' ';
  M.cant1 = 999999;
  M.nom2 := ' ';
  M.cant2 = 999999;
End;

Procedure EliminarRegistros (Var ant:lista;Var act:lista);

Var 
  aux: lista;
Begin
  If (act^.dato.fecha.año <> 2021) Then
    Begin
      ant^.sig := act^.sig;
      aux := act;
      dispose (aux);
      act := ant;
    End;
End;

Procedure MinPartidos (vac:vacunacion;Var M:min);
Begin

  If (vac.) Then
    Begin
    End;
End;

Procedure GenerarLista ();
Begin

End;

Procedure RecorrerLista (Var L:lista; Var V:partidos; Var M:min;Var
                         Lpartidos:
                         listas);

Var 
  aux: lista;
  ant: lista;
Begin
  aux := L;
  ant := L;
  While (aux<>Nil) Do
    Begin
      EliminarRegistros (ant,aux);
      ant := aux;
      V[aux^.dato.codPartido] := V[aux^.dato.codPartido]+aux^.dato.cantVac;
      MinPartidos(aux^.dato,M);
      GenerarLista(aux^.dato,Lpartidos[aux^.dato.codPartido]);
      aux := aux^.sig;
    End;

End;

Var 
  Lpartidos: Listas;
  M: min;
  L: lista;
  V: partidos;
Begin
  CargarLista(L);
  CargarVector (V);
  //se dispone
  InicializarMin(M);
  RecorrerLista (L,V,M);
  Informar(M);
  LiberarLista (L);
End.
