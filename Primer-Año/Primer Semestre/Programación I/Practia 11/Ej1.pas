
Program Ej1;

Const 
  MONTO = 100000;

Type 
  Cadena = string[15];

  cliente = Record
    DNI: Integer;
    nombre: Cadena;
    apellido: Cadena;
    codigo: 1..9;
    monto: real;
  End;

  Lista = ^nodo;
  nodo = Record
    dato: cliente;
    sig: Lista
  End;

  maxCod = array[1..9] Of integer;

Procedure AtencionAlCLiente (Var L:Lista;n:real;Var V:maxCod);

Var 
  aux: Lista;
Begin
  While (n<MONTO) And (L<>Nil) Do
    Begin
      aux := L;
      n := n+L^.dato.monto;
      V[L^.dato.codigo] := V[L^.dato.codigo]+1;
      L := L^.sig;
      dispose (aux);
    End;
End;

Procedure InformarCodigo(V:maxCod);

Var 
  i: integer;
  max: integer;
Begin
  max := -1;
  For i:=1 To 9 Do
    Begin
      If (V[i]>max) Then
        max := i;
    End;
  write ('El codigo de impuestos que se pago mas veces fue el codigo ',max);
End;

Procedure InformarClientes (L:Lista);

Var 
  cont: integer;
Begin
  If (L<>Nil) Then
    Begin
      cont := 0;
      While (L<>Nil) Do
        Begin
          cont := cont+1;
          L := L^.sig;
        End;
      write ('La cantidad de clientes sin atender fueron: ',cont);
    End;
  write ('Se atendieron a todos los clientes');
End;

Var 
  L: Lista;
  neto: real;
  V: maxCod;
Begin
  neto := 0;
  AtencionAlCLiente(L,neto,V);
  InformarCodigo(V);
  InformarClientes(L);
End.
