
Program Ej_2_2;

Type 
  tiempo = Record
    hora: 0..23;
    minutos: 0..59;
  End;

Procedure leerHora (Var reloj: tiempo);
Begin
  read (reloj.hora);
  read (reloj.minutos);

End;
Procedure diferencia (entrada:tiempo; salida:tiempo; Var duracion:tiempo);

Var 
  sexagesimal: integer;
Begin
  If (salida.hora>=entrada.hora) Then
    Begin
      sexagesimal := (salida.hora*60+salida.minutos)-(entrada.hora*60+
                     entrada.minutos);
    End

  Else
    Begin
      sexagesimal := (entrada.hora*60+entrada.minutos)-(salida.hora*60+salida.
                     minutos);
    End;
  duracion.hora := sexagesimal Div 60;
  duracion.minutos := sexagesimal Mod 60;
End;

Var 
  tiempo1,tiempo2,duracion: tiempo;

Begin
  leerHora(tiempo1);
  leerHora(tiempo2);
  diferencia(tiempo1,tiempo2,duracion);
  writeln (duracion.hora,':',duracion.minutos);
End.
