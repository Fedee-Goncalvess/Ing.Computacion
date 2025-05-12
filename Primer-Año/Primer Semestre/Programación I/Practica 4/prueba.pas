
Program prueba;

Type 
  Fecha = Record
    dia: integer;
    mes: integer;
    ano: integer;
  End;
  Hora = Record
    hs: integer;
    min: integer;
  End;
  infoP = Record
    paciente: string;
    Doc: string;
    fecha: Fecha;
    HsLleg: Hora;
    HsSal: Hora;
  End;
Procedure CalcularPacAgosto (info:infoP; Var cantAg:integer);
Begin
  If (info.fecha.mes = 8) Then
    cantAg := cantAg+1;
End;
Procedure LeerFecha (Var f:Fecha);
Begin
  Writeln('Introducir dia');
  Read(f.dia);
  Writeln('Introducir mes');
  Read(f.mes);
  Writeln('Introducir ano');
  Read(f.ano);
End;
Procedure LeerHsLleg (Var hslleg:Hora);
Begin
  Writeln('Introducir hslleg en hs');
  Read(hslleg.hs);
  Writeln('Introducir hslleg en min');
  Read(hslleg.min);
End;
Procedure LeerHsSal (Var hssal:Hora);
Begin
  Writeln('Introducir hssal en hs');
  Read(hssal.hs);
  Writeln('Introducir hssal en min');
  Read(hssal.min);
End;
Procedure LeerInfo (Var info:infoP);
Begin
  Writeln('Introducir paciente');
  Readln(info.paciente);
  Writeln('Introducir doctor');
  Readln (info.Doc);
  LeerFecha (info.fecha);
  LeerHsLleg (info.HsLleg);
  LeerHsSal (info.HsSal);
End;
Procedure Calcular (info:infoP;Var max:integer; Var Paciente:String);

Var horaenmin: integer;
  minenmin: integer;
  HoraTotal: integer;
  HoraTotalEnMin: integer;
  MinTotal: integer;
  Tiempo: integer;
Begin
  horaenmin := (info.HsSal.hs - info.HsLleg.hs) * 60;
  minenmin := info.HsLleg.min - info.HsLleg.min;
  HoraTotalEnMin := horaenmin + minenmin;
  HoraTotal := HoraTotalEnMin Div 60 ;
  MinTotal := HoraTotalEnMin Mod 60;
  Tiempo := HoraTotal+ MinTotal;
  If (Tiempo > max) Then
    Begin
      max := Tiempo;
      Paciente := info.paciente;
    End;
End;

Var info: infoP;
  max: integer;
  Paciente: string;
  cantAg: integer;
Begin
  max := -1;
  cantAg := 0;
  LeerInfo (info);
  CalcularPacAgosto(info,cantAg);
  While (info.fecha.ano <> 0) Do
    Begin
      Calcular (info,max,Paciente);
      LeerInfo (info);
      CalcularPacAgosto(info,cantAg);
    End;
  Writeln('El paciente que mas tardo en ser atendido es: ',Paciente);
  Writeln('La cantidad de pacientes en agosto fue de: ',cantAg);

End.
