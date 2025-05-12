
Program Ej_3;

Type 
  oficina = Record
    num: integer;
    mts: real;
    hab: integer;
    canth: integer;
    precio: integer;
  End;
Procedure leerOficina(Var ofi:oficina);
Begin
  read (ofi.num);
  read (ofi.mts);
  read (ofi.hab);
  read (ofi.canth);
  read (ofi.precio);
End;

Procedure min (Var minh:integer;Var num:integer ; ofi:oficina);
Begin
  If (ofi.canth < minh) Then
    Begin
      minh := ofi.canth;
      num := ofi.num;
    End;
End;

Procedure monto (ofi:oficina; Var total:integer);
Begin
  total := total + (ofi.canth*ofi.precio);
End;

Var 
  oficinas: oficina;
  num,minh,i,total: integer;

Begin
  num := -1;
  minh := 9999;
  total := 0;
  For i := 1 To 15 Do
    Begin
      leerOficina (oficinas);
      monto (oficinas,total);
      writeln ('total: ',total);
      min (minh,num,oficinas);
      writeln('minimo: ', num)
    End;
  write (minh,total);
End.
