
Program Ej_2;

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

Begin
  If (salida.minutos>=entrada.minutos) Then
    Begin
      If (salida.hora>=entrada.hora) Then
        Begin
          duracion.minutos := salida.minutos-entrada.minutos;
          duracion.hora := salida.hora-entrada.hora;
        End
      Else
        Begin
          duracion.minutos := 60-(salida.minutos-entrada.minutos);
          duracion.hora := entrada.hora-salida.hora-1;
        End;
    End
  Else
    Begin
      If (salida.hora>entrada.hora)Then
        Begin
          duracion.minutos := 60-(entrada.minutos-salida.minutos);
          duracion.hora := salida.hora-entrada.hora-1;
        End
      Else
        Begin
          duracion.minutos := entrada.minutos-salida.minutos;
          duracion.hora := entrada.hora-salida.hora;
        End;
    End;
End;

Var 
  tiempo1,tiempo2,duracion: tiempo;

Begin
  leerHora(tiempo1);
  leerHora(tiempo2);
  diferencia(tiempo1,tiempo2,duracion);
  writeln (duracion.hora,':',duracion.minutos);
End.
