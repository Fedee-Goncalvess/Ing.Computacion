
Program Ej2;

Type 
  abc = set Of char;


  cadena = array [1..70] Of char;

  cadenaNombre = string[15];

  persona = Record
    nombre: cadenaNombre;
    apellido: cadenaNombre;
    cat: 1..4;
    monto: real;
    direccion: cadena;
  End;

  lista = ^nodo;
  nodo = Record
    dato: persona;
    sig: lista;
  End;

  listaLetras = ^nodoL;
  nodoL = Record
    car: char;
    sig: listaLetras;
  End;

  tabla = array[1..4] Of real;

  max = Record
    nombre: cadenaNombre;
    pagos: real;
  End;

Procedure Categoria2 (P:persona; Var M:max);
Begin
  If (P.cat=2) And (P.monto>M.pagos) Then
    Begin
      M.nombre := P.nombre;
      M.pagos := P.monto;
    End;
End;


Procedure InsertarElemento (car:Char; Var L:listaLetras);

Var 
  aux: listaLetras;
  nue: listaLetras;
Begin
  new(nue);
  nue^.dato := car;
  nue^.sig := Nil;
  aux := L;
  While (aux^.sig<>Nil) Do
    Begin
      aux := aux^.sig;
    End;
  aux^.sig := nue;
End;


Function cumpleDireccion (V:cadena): boolean;

Var 
  exito: boolean;
  i: integer;
  ACD: abc;
  PAR: abc;
  DIG: abc;
  L: listaLetras;
Begin
  L := Nil;
  ABC := ['A'..'G'];
  PAR := ['0']+['2']+['4']+['6']+['8'];
  DIG := ['0'..'9'];
  exito := true;
  i := 1;
  While (V[i]<>'%') And (exito) Do
    Begin
      If (V[i]In ACD) Then
        Begin
          Case V[i] Of 
            'A' : InsertarElemento ('a', L);
            'B' : InsertarElemento ('b', L);
            'C' : InsertarElemento ('c', L);
            'D' : InsertarElemento ('d', L);
            'E' : InsertarElemento ('e', L);
            'F' : InsertarElemento ('f', L);
            'G' : InsertarElemento ('g', L);
          End;
        End
      Else
        Begin
          If (V[i]In PAR) Then
            dig := dig- V[i]
          Else
            exito := false;
        End;
      i := i+1;
    End;
  If (exito) And (V[i]='%') Then
    {PARTE B}
    Begin
      i := i+1;
      While (V[i]<>'%') And (exito) Do
        Begin
          If (V[i] = L^.dato)  Then
            Begin
              L := L^.sig;
              i := i+1;
            End
          Else
            exito := false;
        End;
    End
  Else
    exito := false;
  If (exito) And (V[i]='%') Then
    Begin
      i := i+1;
      While (i<=70) Do
        Begin
          If (V[i] In PAR) Then
            Begin
              i := i+1;
            End
          Else
            exito := false;
        End;
    End
  Else
    exito := false;
End;

Procedure RecorrerLista (L:lista;Var V:tabla;Var M:max;Extra:tabla);

Var 
Begin
  While (L<>Nil) Do
    Begin
      Categoria2(L^.dato,M);
      V[L^.dato.cat] := V[L^.dato.cat]+L^.dato.monto+Extra[L^.dato.cat];
      If (cumpleDireccion(L^.dato.direccion))Then write ('Cumple Direccion')
      Else Write ('No cumple dirección');
    End;
End;

Begin

End;
