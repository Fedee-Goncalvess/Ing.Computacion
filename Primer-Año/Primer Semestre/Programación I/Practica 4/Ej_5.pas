
Program Ej_5;

Type 
  fechas = Record
    dia: 1..30;
    mes: 1..12;
    anio: integer;
  End;

  horas = Record
    hs: 0..23;
    min: 0..59;
  End;
  pacientes = Record
    nombre: string[15];
    medico: string[15];
    fecha: fechas;
    entrada: horas;
    salida: horas;
  End;

Procedure leerFecha (Var fecha:fechas);
Begin
  writeln ('introducir dia');
  readln (fecha.dia);
  writeln ('introducir mes');
  readln (fecha.mes);
  writeln ('introducir anio');
  readln (fecha.anio);
End;

Procedure leerEntrada (Var entrada:horas);
Begin
  writeln ('introducir hora de entrada');
  readln (entrada.hs);
  writeln ('introducir minutos de entrada');
  readln (entrada.min);
End;

Procedure leerSalida (Var salida:horas);
Begin
  writeln ('introducir hora de salida');
  readln (salida.hs);
  writeln ('introducir minutos de salida');
  readln (salida.min);
End;

Procedure leerPaciente (Var persona:pacientes);
Begin
  writeln ('introducir paciente');
  readln (persona.nombre);
  writeln ('introducir medico');
  readln (persona.medico);
  leerFecha (persona.fecha);
  leerEntrada (persona.entrada);
  leerSalida (persona.salida);
End;

Procedure difMax (valor:pacientes;Var maxh:integer;Var alias:String);

Var 
  diferencia: integer;
Begin
  diferencia := ((valor.salida.hs*60)+(valor.salida.min))- ((valor.
                entrada.hs*60)+(valor.entrada.min));
  If (diferencia> maxh) Then
    alias := valor.nombre;
End;

Var 
  persona: pacientes;
  maxh: integer;
  alias: String;
  cantp: integer;
Begin
  leerPaciente (persona);
  maxh := -1;
  cantp := 0;
  While (persona.fecha.anio<>0) Do
    Begin
      difMax (persona,maxh,alias);
      If (persona.fecha.mes=8) Then
        cantp := cantp+1;

      leerPaciente (persona);

    End;
  write (alias,cantp);
End.
