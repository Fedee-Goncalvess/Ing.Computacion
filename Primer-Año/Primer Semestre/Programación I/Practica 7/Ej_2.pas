
Program Ej_2;

Const 
  cajas = 6;

Type 
  caja = Record
    monto: real;
    num: integer;
  End;
  vectores = array[1..cajas] Of caja;

Procedure LeerCaja (Var CJ:caja);
Begin
  write ('Introducir Numero de Caja');
  read (CJ.num);
  If (CJ.num <> 0 ) Then
    Begin
      Write ('Introducir Monto de Caja');
      read(CJ.monto);
    End;
End;

Procedure Cargar (Var C:vectores);

Var 
  i: integer;
Begin
  For i:=1To cajas Do
    c[i].monto := 0;
End;

Procedure Informar (Var C:vectores);
Function Prom (Var C:vectores): real;

Var 
  tot: real;
  i: integer;

Begin
  tot := 0;
  For i:=1 To cajas Do
    tot := tot + C[i].monto;
  prom := tot / cajas;
End;

Var 
  i,num: integer;
  max: real;
Begin
  max := -1;
  For i:=1 To cajas Do
    If (C[i].monto> max) Then
      Begin
        max := C[i].monto;
        num := C[i].num;
      End;
  write ('El numero de caja que mas reacudó fue: ',num,
         ' mientras que el promedio por caja fue de: ',Prom(C): 2: 2);
End;

Var 
  C: vectores;
  maxnum: integer;
  promcaja: integer;
  CJ: caja;

Begin
  Cargar(C);
  LeerCaja(CJ);
  While (CJ.num<> 0) Do
    Begin
      C[CJ.num].monto := C[CJ.num].monto +CJ.monto;
      LeerCaja(CJ)
    End;
  Informar(C);
End.
