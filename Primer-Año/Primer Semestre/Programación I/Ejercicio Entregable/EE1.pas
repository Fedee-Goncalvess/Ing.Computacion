
Program EE1;

Const 
  MAX_PRODUCTO = 40;

Type 
  TCodigoProducto = string[8];
  TDescripProducto = string[50];

  producto = Record
    cant: integer;
    monto: real;
    codigo: TCodigoProducto;
  End;

  ListaP = ^nodo;
  nodo = Record
    prod: producto;
    sig: ListaP;
  End;

  TProducto = Record
    codigo: TCodigoProducto;
    descripcion: TDescripProducto;
  End;
  TProductos = array[1..MAX_PRODUCTO] Of TProducto;

Const 
  PRODUCTOS: TProductos = (
                           (codigo: 'ABC-0123'; descripcion: 'Muñeca de trapo')
                          ,
                          (codigo: 'ABC-1234'; descripcion:
                           'Set de pinturas acrílicas para niños'),
                          (codigo: 'BCD-2345'; descripcion:
                           'Juego de construcción de bloques'),
                          (codigo: 'BCD-3456'; descripcion:
                           'Puzzle de madera con formas geométricas'),
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
                          (codigo: 'GHI-0123'; descripcion: 'Pelota de fútbol')
                          ,
                          (codigo: 'GHI-1234'; descripcion:
                           'Kit de pinturas al óleo para niños'),
                          (codigo: 'HIJ-2345'; descripcion:
                           'Juego de mesa de ajedrez'),
                          (codigo: 'HIJ-3456'; descripcion:
                           'Patinete con ruedas de silicona'),
                          (codigo: 'JKL-4567'; descripcion:
                           'Muñeco de acción con accesorios'),
                          (codigo: 'JKL-5678'; descripcion:
                           'Juego de herramientas de plástico'),
                          (codigo: 'KLM-6789'; descripcion:
                           'Cocinita de juguete'),
                          (codigo: 'KLM-7890'; descripcion:
                           'Set de construcción de pista de carreras'),
                          (codigo: 'LMN-8901'; descripcion:
                           'Juego de cartas Uno'),
                          (codigo: 'LMN-9012'; descripcion: 'Cubo de Rubik'),
                          (codigo: 'MNO-0123'; descripcion:
                           'Muñeca de juguete con accesorios'),
                          (codigo: 'MNO-1234'; descripcion:
                           'Juego de construcción de aviones de juguete'),
                          (codigo: 'NOP-0123'; descripcion:
                           'Juego de mesa de la oca'),
                          (codigo: 'NOP-1234'; descripcion:
                           'Kit de experimentos de ciencias para niños'),
                          (codigo: 'PQR-2345'; descripcion:
                           'Set de herramientas de carpintería de juguete'),
                          (codigo: 'PQR-3456'; descripcion:
                           'Juego de cocina de juguete'),
                          (codigo: 'QRS-4567'; descripcion:
                           'Set de experimentos de química para niños'),
                          (codigo: 'QRS-5678'; descripcion:
                           'Kit de jardinería de juguete'),
                          (codigo: 'STU-6789'; descripcion:
                           'Puzzle de suelo con letras y números'),
                          (codigo: 'STU-7890'; descripcion:
                           'Kit de arte y manualidades para niños'),
                          (codigo: 'TUV-8901'; descripcion:
                           'Set de construcción de robots de juguete'),
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
                           'Juego de mesa de Parchís'),
                          (codigo: 'WXY-5678'; descripcion:
                           'Helicóptero de control remoto'),
                          (codigo: 'XYZ-6789'; descripcion:
                           'Puzzle 3D de monumentos famosos'),
                          (codigo: 'XYZ-7890'; descripcion:
                           'Juego de construcción de castillo de juguete'),
                          );

Procedure (v:TProducto,c:TCodigoProducto);
Begin
End;

Var 

Begin

End;
