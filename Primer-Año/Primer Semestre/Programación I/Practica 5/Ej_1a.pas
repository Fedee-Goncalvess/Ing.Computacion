
Program Ej_1a;

Type 
  Colectivo = Record
    linea: Integer;
    patente: string [9];
    monto: integer;
  End;
Procedure leerColectivo (Var dato:colectivo);
Begin
  writeln ('Introducir Linea');
  readln (dato.linea);
  If (dato.linea <> 0) Then
    Begin
      writeln ('Introducir patente');
      read (dato.patente);
      writeln ('Introducir monto');
      read (dato.monto);
    End;
End;
Procedure procesarMonto (dato:colectivo ;Var total:integer);
Begin
  total := total+dato.monto;
End;

Procedure imprimirInfo (act:integer; total:integer);
Begin
  write ('Total monto de la linea ',act, ' es de: ', total);
End;

Var 
  total,act: integer;
  dato: colectivo;

Begin
  total := 0;
  leerColectivo (dato);
  While (dato.linea <>0 ) Do
    Begin
      act := dato.linea;
      While (dato.linea<>0) And (dato.linea =act) Do
        Begin
          procesarMonto (dato,total);
          leerColectivo (dato);
        End;
      imprimirInfo (act,total);
    End;
End.
