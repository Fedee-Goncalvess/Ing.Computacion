
Program repaso;

Type 
  producto = Record
    marca: string;
    anio: integer;
    precio: real;
    codigo: integer;
    nombre: string;
  End;

  listaTot = ^nodo;
  nodo = Record
    dato: producto;
    sig: listaTot;
  End;

  prod = Record
    codigo: integer;
    precio: real;
    nombre: string;
  End;

  listaProd = ^nodoprod;
  nodoprod = Record
    dato: prod;
    sig: listaProd;
  End;

  AnioRecord = Record
    anio: integer;
    prods: listaProd;
  End;

  listaAnio = ^nodoanio;
  nodoanio = Record
    dato: AnioRecord;
    sig: listaAnio;
  End;

  MarcaRecord = Record
    nombre: string;
    anios: listaAnio;
  End;

  listaMarcas = ^nodoMarcas;
  nodoMarcas = Record
    dato: AnioRecord;
    sig: listaMarcas
  End;

Procedure AgregarAlFinalListaProd (Var lprod:lista_prod;Var lanio:listaAnio);
Begin

End;

Procedure AgregarAlFinalListaAnio (Var lprod:lista_prod;Var lanio:listaAnio);
Begin

End;

Procedure AgregarAlFinalListaMarca (Var lprod:lista_prod;Var lanio:listaAnio);
Begin

End;

Procedure corteDeControl (ltot:listaTot;Var lmarcas:listaMarcas; Var lanio:
                          listaAnio; Var lprod:listaProd; Var marcaActual:String
                          ;Var anioActual:integer);

Var 
Begin
  If (marcaActual=ltot.dato.marca) Then
    Begin
      If (anioActual= ltot.dato.anio ) Then
        Begin
          AgregarAlFinalListaProd (ltot.dato,lprod,lanio);
        End
      Else
        Begin
          anioActual := lprod.dato.ano;
          AgregarAlFinalListaAnio (lprod,lanio);
        End;
    End
  Else
    Begin
      marcaActual := lprod.dato.marca;
      AgregarAlFinalListaMarca();
    End;
End;


Var 
  ltot: listaTot;
  lmarcas: listaMarcas;
  lanio: listaAnio;
  lprod: listaProd;
  marcaActual: string;
  anioActual: integer;
Begin
  cargarLista (ltot);
  //se dispone
  lmarcas := Nil;
  lanio := Nil;
  lprod := Nil;
  While (ltot<>Nil) Do
    Begin
      marcaActual := ltot.dato.marca;
      anioActual := ltot.dato.anio;
      corteDeControl (ltot,lmarcas,lanio);

      ltot := ltot^.sig;
    End;
End.
