
Program Ej4;

Type 

  calendario = Record
    dia: 1..30;
    mes: 1..12;
    año: integer;
  End;

  localidad = Record
    calle: 1..122;
    num: integer;
    piso: integer;
    departamento: char;
  End;

  paquete = Record
    fecha: calendario;
    entregado: boolean;
    direccion: localidad;
  End;

  lista = ^nodo;
  nodo = Record
    dato: paquete;
    sig: lista;
  End;

  envios = array[1..122] Of integer;
  meses = array[1..12] Of integer;
  NuevasListas = array [11..20] Of lista;

Procedure EliminarNodo (Var L:lista;Var act:lista; Var ant:lista);

Begin
  If (L=act) Then
    L := L^.sig
  Else
    ant^.sig := act^.sig;
  dispose (act);
  act := ant^.sig;
End;


Procedure InsertarOrdenado (elem:paquete; Var L:lista);

Var 
  nue: lista;
  aux: lista;
  ant: lista;
Begin
  New(nue);
  nue^.dato := elem;

  aux := L;
  ant := L;
  While (aux<>Nil) And (nue^.dato.direccion.num>aux^.dato.direccion.num) Do
    Begin
      ant := aux;
      aux := aux^.dato;
    End;

  If (aux=L) Then
    Begin
      nue^.sig := L;
      L := nue;
    End
  Else
    Begin
      ant^.sig := nue;
      nue^.sig := aux;
    End;
End;



Procedure RecorrerLista (Var L:lista; Var Env:envios; Var Mes:meses;Var NL:
                         NuevasListas);

Var 
  ant,aux: lista;
Begin
  aux := L;
  ant := aux;
  While (aux<>Nil) Do
    Begin
      If (aux^.dato.entregado) Then
        Begin
          Env[aux^.dato.direccion.calle] := Env[aux^.dato.direccion.calle]+1;
          Mes[aux^.dato.fecha.mes] := Mes[aux^.dato.fecha.mes]+1;
          If (aux^.dato.direccion.calle>=11) And (aux^.dato.direccion.calle<=20)
            Then
            InsertarOrdenado (aux^.dato,NL[aux^.dato.direccion.calle]);
          ant := aux;
          aux := aux^.sig
        End
      Else
        EliminarNodo(L,aux,ant);
    End;

End;

Procedure InformarEnvios (Env:envios);

Var 
  i: integer;
Begin
  For i:=1 To 122 Do
    Begin
      write ('A la calle ',i,' se hicieron ',Env[i],' envios ' );
    End;
End;

Procedure InformarMes (Mes:meses);

Var 
  i: integer;
  max: integer;
  mes: integer;
Begin
  max := -1;
  For i:= 1 To 12 Do
    Begin
      If (Mes[i]>max) Then
        Begin
          max := Mes[i];
          mes := i;
        End;
    End;
  Case mes Of 
    1: write ('El mes con mayor cantidad de paquetes enviados fue enero');
    2: write ('El mes con mayor cantidad de paquetes enviados fue febrero');
    3: write ('El mes con mayor cantidad de paquetes enviados fue marzo');
    4: write ('El mes con mayor cantidad de paquetes enviados fue abril');
    5: write ('El mes con mayor cantidad de paquetes enviados fue mayo');
    6: write ('El mes con mayor cantidad de paquetes enviados fue junio');
    7: write ('El mes con mayor cantidad de paquetes enviados fue julio');
    8: write ('El mes con mayor cantidad de paquetes enviados fue agosto');
    9: write ('El mes con mayor cantidad de paquetes enviados fue septiembre');
    10: write ('El mes con mayor cantidad de paquetes enviados fue octubre');
    11: write ('El mes con mayor cantidad de paquetes enviados fue nobiembre');
    12: write ('El mes con mayor cantidad de paquetes enviados fue diciembre');
  End;
End;

Procedure LiberarLista (Var L:lista);

Var 
  aux: lista;
Begin
  While (L<>Nil) Do
    Begin
      aux := L;
      L := L^.sig;
      dispose (aux);
    End;
End;

Procedure CargarVectorEnvios (Var Env:envios);

Var 
  i: integer;
Begin
  For i:=1 To 122 Do
    Begin
      Env[i] := 0;
    End;
End;

Procedure CargarVectorMes (Var Mes:meses);

Var 
  i: integer;
Begin
  For i:=1 To 12 Do
    Begin
      Mes[i] := 0;
    End;
End;


Procedure CargarNuevasListas (Var NL:NuevasListas);

Var 
  i: integer;
Begin
  For i:=1 To 10 Do
    Begin
      NL[i] := Nil;
    End;
End;


Var 
  L: lista;
  Env: envios;
  Mes: meses;
Begin
  CargarNuevasListas(NL);
  CargarVectorEnvios(Env);
  CargarVectorMes(Mes);
  RecorrerLista(L,Env,Mes);
  InformarEnvios(Env);
  InformarMes(Mes);
  LiberarLista(L);
End.
