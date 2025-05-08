
Program Ej_2a;

Type 
  Empleados = Record
    dni: integer;
    sueldo: integer;
    dep: integer;
    suc: integer;
  End;

  Max = Record
    sueldo1: integer;
    dep1: integer;
    suc1: integer;
    sueldo2: integer;
    dep2: integer;
    suc2: integer;
  End;
Procedure leerEmpleado (Var dato:Empleados);
Begin
  writeln ('Introducir suc');
  read (dato.suc);
  If (dato.suc <> -1) Then
    Begin
      writeln ('Introducir dni');
      read (dato.dni);
      writeln ('Introducir sueldo');
      read (dato.sueldo);
      writeln ('Introducir dep');
      read (dato.dep);
    End;
End;

Procedure depMax (dato:Empleados; Var max1:integer; Var max2:integer;Var suc1:
                  integer; Var suc2:integer; Var dep1:integer; Var dep2:integer)
;
Begin
  If (dato.sueldo>max1) Then
    Begin
      max1 := dato.sueldo;
      suc1 := dato.suc;
      dep1 := dato.dep;
    End
  Else
    If (dato.sueldo>max2) Then
      Begin
        max2 := dato.sueldo;
        suc2 := dato.suc;
        dep2 := dato.dep;
      End;
End;

Var 

  max1,max2,suc1,suc2,dep1,dep2,suc,dep: integer;
  dato: Empleados;
  totS: integer;
Begin
  leerEmpleado (dato);
  While (dato.suc <> -1) Do
    Begin
      totS := 0;
      suc := dato.suc;
      While (dato.suc <> 0) And (dato.suc=suc) Do
        Begin
          dep := dato.dep;
          While (dato.suc <>0) And (dato.suc=suc) And (dato.dep=dep) Do
            Begin
              depMax (dato,max1,max2,suc1,suc2,dep1,dep2);
              totS := totS+dato.sueldo;
              leerEmpleado(dato);
            End;
        End;
      writeln ('El monto total de ',suc,' es de: ',totS);
    End;
  writeln ('El departamento ',dep1,' de la sucursal ',suc1,
           ' tiene el mayor monto de sueldos');
  writeln ('El departamento ',dep2,' de la sucursal ',suc2,
           ' tiene el segundo mayor monto de sueldos');

End.
