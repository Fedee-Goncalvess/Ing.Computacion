Program Parcial2;
Uses
     sysutils;
Type
     str10= string[10];
     str20= string[20];
     aplicacion = record
                  vacuna: str20;
                  nroLote: string;
                  nombreApellido: string;
                  dni: longint;
                  fecha: str10;
                  dosis: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
                  dato: aplicacion;
                  sig: lista;
     end;

     aplicacionArbol = record
                    vacuna:str20;
                    nroLote:string;
                    dosis:integer;
                    fecha:str10;
     end;

     listaAplicaciones = ^nodoAplicacion;
     nodoAplicacion = record
                  dato:aplicacionArbol;
                  sig:listaAplicaciones;
     end;

     paciente = record
                  DNI:longint;
                  nombreApellido:string;
                  vacunas:listaAplicaciones;
                  ultVacunas:listaAplicaciones;
     end;

     arbol = ^nodoArbol;
     nodoArbol = record
               dato:paciente;
               HI:arbol;
               HD:arbol;
     end;

Procedure CargarVacunas (var l, ult: listaAplicaciones; elem:aplicacion);
var
   nue:listaAplicaciones;
begin
    new (nue);
    nue^.dato.vacuna:=elem.vacuna;
    nue^.dato.nroLote:=elem.nroLote;
    nue^.dato.dosis:=elem.dosis;
    nue^.dato.fecha:=elem.fecha;
    nue^.sig := nil;
    if (l= nil) then l:= nue
    else ult^.sig:= nue;
    ult:= nue;
end;


Procedure CargarNodo (var a:paciente; elem:aplicacion);
begin
  a.DNI:=elem.dni;
  a.nombreApellido:=elem.nombreApellido;
  a.vacunas:=nil;
  CargarVacunas(a.vacunas,a.ultVacunas,elem);
end;

Procedure insertarArbol(var a:arbol; elem: aplicacion);
begin
     if(a=NIL)then
     begin
         new(a);
         CargarNodo(a^.dato,elem);
         a^.HI:=nil;
         a^.HD:=nil;
     end
     else
         if (a^.dato.DNI>elem.dni)then
             insertararbol(a^.HI,elem)
         else
             if(a^.dato.DNI<elem.dni)then
                 insertararbol(a^.HD,elem);
end;

Procedure CargarArbol (l:lista; var a:arbol);
begin
     while (l<>nil) do begin
          insertarArbol(a,l^.dato);
          l:=l^.sig;
     end;
end;

Procedure imprimirVacunas (l:listaAplicaciones);
begin
     while (l^.sig<>nil)do begin
          write (l^.dato.vacuna,', ');
          l:=l^.sig;
     end;
     writeln(l^.dato.vacuna,'.');
end;
{-------------------------------------------------}

Procedure impresionDNI20y50(a:arbol; var n:integer);
var
   inf:longint;
   sup:longint;
begin
  inf:=20000000;
  sup:=50000000;
  if (a <> nil) then
    if (a^.dato.DNI >= inf) then
      if (a^.dato.DNI <= sup) then begin
        impresionDNI20y50(a^.hi,n);
        write(n,'. ',a^.dato.DNI,'    ');
        n:=n+1;
        imprimirVacunas (a^.dato.vacunas);
        impresionDNI20y50 (a^.hd,n);
      end
      else
        impresionDNI20y50(a^.hi,n)
    else
      impresionDNI20y50(a^.hd,n);
end;
Procedure incisoB (a:arbol);
var
   n:integer;
begin
  n:=1;
  impresionDNI20y50(a,n);
end;

Procedure CalcularMax (a:paciente; var dni:longint; var nombreApellido:string;var cant:integer;var dosis:integer);
var
    tot:integer;
    totD:integer;
begin
    tot:=0;
    totD:=0;
    while (a.vacunas<>nil) do begin
         tot:=tot+1;
         totD:=totD+a.vacunas^.dato.dosis;
         a.vacunas:=a.vacunas^.sig;
    end;
    if (tot>cant) and (totD>dosis)then begin
       cant:=tot;
       dosis:=totD;
       nombreApellido:=a.nombreApellido;
       dni:=a.dni;
    end;
end;

Procedure buscarMaxPaciente(a:arbol; var dni:longint; var nombreApellido:string;var cant:integer;var dosis:integer);
begin
    if(a<>nil)then
    begin
      CalcularMax (a^.dato,dni,nombreApellido,cant,dosis);
      buscarMaxPaciente(a^.HI,dni,nombreApellido,cant,dosis);
      buscarMaxPaciente(a^.HD,dni,nombreApellido,cant,dosis);
    end;
end;

Procedure PacienteConMasVacunas(a:arbol; var dni:longint; var nombreApellido:string);
var
   cant:integer;
   dosis:integer;
begin
  cant:=-1;
  dosis:=-1;
  buscarMaxPaciente (a,dni,nombreApellido,cant,dosis);
end;
{-------------------------------------------------}
function cargarFecha(): str10;
var
  dia, mes, anio: integer;
  strDia, strMes: string;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  anio := 2000 + random(21);
  if(mes = 2) and (dia > 28)then
         dia := 31;
  if((mes = 4) or (mes = 6) or (mes =9) or (mes = 11)) and (dia = 31)then
	  dia := 30;
  strMes := IntToStr(mes);
  if(mes < 10)then
         strMes:= Concat('0',strMes);
  strDia := IntToStr(dia);
  if(dia < 10)then
         strDia:= Concat('0',strDia);

  cargarFecha:= Concat(IntToStr(anio),'/',strMes,'/',strDia);
end;

Procedure agregar(var l: lista; a: aplicacion);
var
   nue, anterior, actual: lista;
begin
  new(nue);
  nue^.dato:= a;
  nue^.sig:= nil;

  actual:= l;
  anterior:= l;
  while(actual<>nil)and(actual^.dato.fecha < nue^.dato.fecha)do begin
    anterior:= actual;
    actual:= actual^.sig;
  end;
  if(anterior=actual)then
    l:= nue
  else
    anterior^.sig:= nue;
  nue^.sig:=actual;
end;

procedure crearLista(var l: lista);
var
   a: aplicacion;
   cant, i: integer;
   v : array [1..7] of string;
begin
     v[1]:= 'BCG';
     v[2]:= 'Triple Viral';
     v[3]:= 'Antigripal';
     v[4]:= 'Doble Bacteriana';
     v[5]:= 'Hepatitis B';
     v[6]:= 'Rotavirus';
     v[7]:= 'COVID-19';

     cant := random(100)+10;
     for i:=1 to cant do
     begin
          with(a) do begin
            vacuna:= v[random(7)+1];
            nroLote:= Concat(IntToStr(random(10000000)));
            dni := random(36000000)+2000000;
            nombreApellido:= Concat('Paciente-', IntToStr(dni));
            dosis:= random(3)+1;
            fecha:= cargarFecha();
          end;
          agregar(l, a);
     end;
end;

procedure imprimir(a: aplicacion);
begin
     with (a) do begin
          writeln('Vac. ',vacuna, ' Lote ',nroLote,' Para: ', nombreApellido, ' con dni ');
          writeln('Vacunado: ', fecha, ' y dosis: ', dosis);
          writeln('');
     end;
end;

procedure imprimirLista(l: lista);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

var
   l: lista;
   dni:longint;
   a:arbol;
   nombreApellido:string;
begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automática de la estructura disponible}
     writeln ('Lista generada: ');
     imprimirLista(l);

     {Completar el programa}
     a:=nil;
     CargarArbol (l,a);

     incisoB (a);

     PacienteConMasVacunas (a,dni,nombreApellido);
     write ('El paciente con mas vacunas es: ',nombreApellido,' con DNI: ',dni);
     writeln('Fin del programa');
     readln;
end.
