
Program EjEntregable;

Const 
  MAX_PRODUCTO = 40;
  MAX_COMPRA = 10;

Type 

  CadenaCodigo = string[8];
  CadenaDescrip = string[50];

  producto = Record
    cantCompras: integer;
    precio: real;
    codigo: CadenaCodigo;
  End;

  VecProds = array[1..MAX_COMPRA] Of producto;

  venta = Record
    cliente: string[15];
    cantprods: integer;
    prods: VecProds;
  End;

  ListaVentas = ^nodoVenta;
  nodoVenta = Record
    dato: venta;
    sig: ListaVentas;
  End;



  TProducto = Record
    codigo: CadenaCodigo;
    descripcion: CadenaDescrip;
  End;



  TProductos = array [1..MAX_PRODUCTO] Of TProducto;

Const 
  PRODUCTOS: TProductos = ((codigo: 'ABC-0123'; descripcion: 'Muñeca de trapo')
                          ,
                          (codigo: 'ABC-1234'; descripcion:
                           'Set de pinturas acrilicas para niños'),
                          (codigo: 'BCD-2345'; descripcion:
                           'Juego de construccion de bloques'),
                          (codigo: 'BCD-3456'; descripcion:
                           'Puzzle de madera con formas geometricas'),
                          (codigo: 'CDE-4567'; descripcion:
                           'Set de maquillaje para niñas'),
                          (codigo: 'CDE-5678'; descripcion:
                           'Juego de mesa de Monopoly'),
                          (codigo: 'DEF-6789'; descripcion: 'Coche teledirigido'
                          ),
                          (codigo: 'DEF-7890'; descripcion:
                           'Rompecabezas de 100 piezas'),
                          (codigo: 'EFG-8901'; descripcion:
                           'Rompecabezas de 50 piezas'),
                          (codigo: 'EFG-9012'; descripcion:
                           'Rompecabezas de 25 piezas'),
                          (codigo: 'GHI-0123'; descripcion: 'Pelota de futbol'),
                          (codigo: 'GHI-1234'; descripcion:
                           'Kit de pinturas al oleo para niños'),
                          (codigo: 'HIJ-2345'; descripcion:
                           'Juego de mesa de ajedrez'),
                          (codigo: 'HIJ-3456'; descripcion:
                           'Patinete con ruedas de silicona'),
                          (codigo: 'JKL-4567'; descripcion:
                           'Muñeco de accion con accesorios'),
                          (codigo: 'JKL-5678'; descripcion:
                           'Juego de herramientas de plastico'),
                          (codigo: 'KLM-6789'; descripcion:
                           'Cocinita de juguete'),
                          (codigo: 'KLM-7890'; descripcion:
                           'Set de construccion de pista de carreras'),
                          (codigo: 'LMN-8901'; descripcion:
                           'Juego de cartas Uno'),
                          (codigo: 'LMN-9012'; descripcion: 'Cubo de Rubik'),
                          (codigo: 'MNO-0123'; descripcion:
                           'Muñeca de juguete con accesorios'),
                          (codigo: 'MNO-1234'; descripcion:
                           'Juego de construccion de aviones de juguete'),
                          (codigo: 'NOP-0123'; descripcion:
                           'Juego de mesa de la oca'),
                          (codigo: 'NOP-1234'; descripcion:
                           'Kit de experimentos de ciencias para niños'),
                          (codigo: 'PQR-2345'; descripcion:
                           'Set de herramientas de carpinteria de juguete'),
                          (codigo: 'PQR-3456'; descripcion:
                           'Juego de cocina de juguete'),
                          (codigo: 'QRS-4567'; descripcion:
                           'Set de experimentos de quimica para niños'),
                          (codigo: 'QRS-5678'; descripcion:
                           'Kit de jardineria de juguete'),
                          (codigo: 'STU-6789'; descripcion:
                           'Puzzle de suelo con letras y numeros'),
                          (codigo: 'STU-7890'; descripcion:
                           'Kit de arte y manualidades para niños'),
                          (codigo: 'TUV-8901'; descripcion:
                           'Set de construccion de robots de juguete'),
                          (codigo: 'TUV-9012'; descripcion:
                           'Juego de bolos de juguete'),
                          (codigo: 'UVW-0123'; descripcion:
                           'Juego de mesa de damas chinas'),
                          (codigo: 'UVW-1234'; descripcion:
                           'Set de sellos y tinta para niños'),
                          (codigo: 'VWX-2345'; descripcion:
                           'Set de tren de juguete'),
                          (codigo: 'VWX-3456'; descripcion:
                           'Kit de modelado de plastilina'),
                          (codigo: 'WXY-4567'; descripcion:
                           'Juego de mesa de Parches'),
                          (codigo: 'WXY-5678'; descripcion:
                           'Helicoptero de control remoto'),
                          (codigo: 'XYZ-6789'; descripcion:
                           'Puzzle 3D de monumentos famosos'),
                          (codigo: 'XYZ-7890'; descripcion:
                           'Juego de construccion de castillo de juguete'));


Procedure CargarVector(Var V:TProductos);
{Carga los productos de promocion en una variable}

Var 
  i: integer;
Begin
  For i:= 1 To MAX_PRODUCTO Do
    Begin
      V[i] := PRODUCTOS[i];
    End;
End;

Procedure buscarNombre (P:TProductos; codigo:CadenaCodigo; Var nombre:
                        cadenaDescrip);

Var 
  {retorna un nombre a partir de un codigo por parametro}
  i: integer;
  fin: integer;
  medio: integer;
  exito: boolean;
Begin
  exito := false;
  i := 1;
  fin := MAX_PRODUCTO;
  While (i<=fin)And (Not exito) Do
    Begin
      medio := (i+fin) Div 2;
      If (P[medio].codigo=codigo) Then exito := true;
      If (P[medio].codigo<codigo) Then i := medio+1;
      If (P[medio].codigo>codigo) Then fin := medio -1;
    End;
  If (exito=true) Then  nombre := P[i].descripcion
  Else nombre := '';
End;


Function existeCodigo (P:TProductos;codigo:CadenaCodigo): boolean;

Var 
  n: cadenaDescrip;
  {con el modulo de buscarNombre, evalua si existe o no un codigo}
Begin
  buscarNombre (P,codigo,n);
  If (n='') Then existeCodigo := false
  Else existeCodigo := True;
End;


Procedure CargarListaVentaOrdenada(Var L:ListaVentas; V:venta);
{Ordena los datos por parametro en una lista}

Var 
  nue,act,ant: ListaVentas;
Begin
  New (nue);
  nue^.dato := V;
  act := L;
  ant := L;
  While (act<>Nil) And (nue^.dato.cliente>act^.dato.cliente) Do
    Begin
      ant := act;
      act := act^.sig;
    End;

  If (act=L) Then
    Begin
      nue^.sig := L;
      L := nue;
    End
  Else
    Begin
      ant^.sig := nue;
      nue^.sig := act;
    End;
End;


Procedure CargarDatoVenta (P:TProductos;Var L:ListaVentas);
{Carga los datos de una venta}

Var 
  V: venta;
  i: integer;
Begin
  writeln('ingrese el nombre de un cliente');
  read(V.cliente);
  While (V.cliente<>'zzz') Do
    Begin
      writeln('ingrese la cantidad de productos que compro');
      read(V.cantprods);
      While (V.cantprods>MAX_COMPRA) Do
        Begin
          writeln('ingrese una cantidad de productos menor a 10');
          read (V.cantprods);
        End;
      For i:= 1 To V.cantprods Do
        Begin
          writeln('Insertar cantidad comprada del producto numero ',i);
          read (V.prods[i].cantCompras);
          writeln('ingrese el precio del producto numero ', i);
          readln (V.prods[i].precio);
          writeln('Ingrese el codigo del producto numero ', i);
          readln (V.prods[i].codigo);
          While ( Not existeCodigo(P,V.prods[i].codigo)) Do
            Begin
              writeln('Ingrese un codigo valido del producto');
              readln (V.prods[i].codigo);
            End;
        End;
      CargarListaVentaOrdenada (L,V);
      writeln('ingrese el nombre de un nuevo cliente');
      read(V.cliente);
    End;
End;

Procedure imprimir (P:TProductos; V:venta);
{Imprime la informacion de productos}

Var 
  max: producto;
  cant: real;
  i: integer;
  n: cadenaDescrip;
Begin
  max.precio := -1;
  max.cantCompras := 0;
  max.codigo := '';
  cant := 0;
  For i:= 1 To V.cantprods Do
    Begin
      cant := (cant + V.prods[i].precio * V.prods[i].cantCompras);
      If (V.prods[i].precio * V.prods[i].cantCompras > max.precio * max.
         cantCompras) Then
        max := V.prods[i];
    End;

  writeln ('Monto total: ',cant:2:2,'$');
  buscarNombre(P,max.codigo,n);
  writeln ('producto en el que mas gasto: ',n);
  writeln ('codigo de ese producto: ',max.codigo);
  writeln ('cantidad de ese producto: ',max.cantCompras);
End;


Procedure imprimirCliente (P:TProductos; V:venta);
{imprime la informacion de una venta}
Begin
  writeln('cliente ',V.cliente);
  imprimir(P,V);
End;



Procedure imprimirLista (P:TProductos; L:ListaVentas);
{imprime una lista de ventas}
Begin
  While (L<>Nil) Do
    Begin
      imprimirCliente(P,L^.dato);
      L := L^.sig;
    End;
End;

////////////////////////
Procedure liberarInformar (Var L:ListaVentas; P:TProductos);

Var 
  {imprime una lista de ventas y libera en un solo recorrido}
  aux: ListaVentas;
Begin
  aux := L;
  While (L<>Nil) Do
    Begin
      imprimirCliente(P,L^.dato);
      aux := L^.sig;
      Dispose (L);
      L := aux;
    End;
End;
////////////////////////


Procedure LiberarLista(Var L:ListaVentas);          {libera la lista creada}

Var 
  pri: ListaVentas;
  aux: ListaVentas;
Begin
  aux := L;
  pri := L;
  While (pri<>Nil) Do
    Begin
      aux := pri^.sig;
      Dispose (pri);
      pri := aux;
    End;
  Dispose (pri);
End;

Var 
  V: TProductos;
  L: ListaVentas;
Begin
  CargarVector(V);
  L := Nil;
  CargarDatoVenta(V,L);
  liberarInformar(L,V);
  If (L=Nil) Then write ('Lista borrada.')
    {Comprueba si la lista se borro}
  Else write('Lista no borrada.');
End.
