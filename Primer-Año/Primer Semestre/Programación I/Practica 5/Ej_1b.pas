
Program Ej_1b;

Type 
  Colectivo = Record
    empresa: string[15];
    linea: Integer;
    patente: string [9];
    monto: integer;
  End;
Procedure leerColectivo (Var dato:colectivo);
Begin
  writeln ('Introducir Empresa');
  readln (dato.empresa);
  If (dato.empresa <> 'FIN') Then
    Begin
      writeln ('Introducir Linea');
      readln (dato.linea);
      writeln ('Introducir patente');
      readln (dato.patente);
      writeln ('Introducir monto');
      readln (dato.monto);
    End;
End;
Function procesarMonto (dato:integer ;Var total:integer): integer;
Begin
  procesarMonto := total + dato;

End;

Procedure imprimirInfo (act:integer; total:integer);
Begin
  writeln ('Total monto de la linea ',act, ' es de: ', total);
End;

Var 
  total,actL,monto: integer;
  dato: colectivo;
  actE: string;
Begin

  leerColectivo (dato);
  While (dato.empresa <> 'FIN' ) Do
    Begin
      monto := 0;
      actE := dato.empresa;
      While (dato.empresa<> 'FIN') And (dato.empresa =actE) Do
        Begin
          total := 0;
          actL := dato.linea;
          While (dato.empresa<> 'FIN') And (dato.empresa =actE) And (dato.
                linea= actL) Do
            Begin
              total := procesarMonto (dato.monto,total);
              leerColectivo (dato);
            End;
          imprimirInfo (actL,total);
          monto := procesarMonto (total,monto)
        End;
      writeln ('El monto total de la empresa ',actE,' es de: ', monto);
    End;
End.
