
Program Ej_6;

Const 
  CantS = 7;

Type 
  sucursal = Record
    ventas: integer;
    monto: integer;
    defect: integer;
    vueltos: integer;
  End;

Procedure leerSucursal (Var suc:sucursal);
Begin
  writeln ('Introducir ventas');
  read (suc.ventas);
  writeln ('Introducir monto');
  read (suc.monto);
  writeln ('Introducir defect');
  read (suc.defect);
  writeln ('Introducir vueltos');
  read (suc.vueltos);
  suc.monto := suc.monto-(suc.defect*suc.vueltos);
End;

Var 
  suc: sucursal;
  vmes,i,g,gan,min,prom,vsuc: integer;
  minsuc: integer;

Begin
  prom := 0;
  min := 9999;
  For i:=  1 To CantS Do
    Begin
      vmes := 0;
      vsuc := 0;
      For g:= 1 To 12 Do
        Begin
          gan := 0;
          leerSucursal (suc);
          If (g=3) Then
            prom := prom+suc.monto;
          gan := gan+suc.monto;
          If (suc.ventas>vmes)Then
            Begin
              vmes := suc.ventas;
              vsuc := g;
            End;
        End;
      If (gan<min) Then
        Begin
          min := gan;
          minsuc := i;
        End;
      writeln ('El mes que mas vendio la sucursal nro', i, 'fue en el mes', vsuc
      );
    End;
  prom := prom Div 12;
  writeln ('la sucursal con menor ganancia es la sucursal nro ',minsuc);
  writeln (




   'La recaudacion promedio en el mez de marzo de todas las sucursales fue de: '
           , prom);
End.
