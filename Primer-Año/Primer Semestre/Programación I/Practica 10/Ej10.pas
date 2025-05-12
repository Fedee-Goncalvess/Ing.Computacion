
Program Ej10;

Type 
  cliente = Record
    cod: integer;
    apellido: string[15];
    nombre: string[15];
    domicilio: string[15];
    telefono: integer;
  End;
  ListaClientes = ^nodoC;
  nodoC = Record
    dato: cliente;
    sig: ListaClientes;
  End;

  plato = Record
    nombre: string[15];
    stock: integer;
  End;

  Platos = array [1..100] Of plato;

  pedido = Record
    codCliente: integer;
    codPlato: integer;
    cant: integer;
  End;

Procedure LeerPedido(Var P:pedido);
Begin
  read(P.codCliente);
  If (P.cliente <> -1) Then
    Begin;
      read(P.codPlato);
      read(P.cant);
    End;
End;

Procedure ValidarCliente (P:pedido;L:ListaClientes);
Begin
  While (L<>Nil) And (P.codCliente<>L^.dato.cod) Do
    Begin
      L := L^.sig;
    End;
  If (P.codCliente<>L^.dato.cod) Then write('Cliente no encontrado') ;
End;


Procedure ValidarPlato (P:pedido;V:Platos);

Var 
  exito: boolean;
Begin
  If (P.codPlato<=100) And (P.codPlato > 0) Then
    exito := true
  Else
    Begin
      Write ('Codigo de plato incorrecto');
      If (V[P.codplato].stock>0) Then exito := true
      Else
        Begin
          write ('Sin Stock del plato');
          If (exito) Then V[P.codplato] := V[P.codplato]-1;
        End;
    End;
End;


Procedure ValidarPedido (P:pedido;L:ListaClientes;V:Platos);
Begin
  ValidarPlato(P,V);
  ValidarCliente(P,L);
End;

Procedure InformarSinStock (V:platos);
Begin
  i := 1;
  While (i<=100) Do
    Begin
      If (V[i].Stock=0) Then write (V[i].nombre, ' sin stock');
      i := i+1;
    End;
End;

Var 
  P: pedido;
  L: ListaClientes;
  V: Platos;

Begin
  LeerPedido(P);
  While (P.codCliente<>-1) Do
    Begin
      ValidarPedido(P,L,v);
      LeerPedido(P);
    End;
  InformarSinStock(V);
End.
