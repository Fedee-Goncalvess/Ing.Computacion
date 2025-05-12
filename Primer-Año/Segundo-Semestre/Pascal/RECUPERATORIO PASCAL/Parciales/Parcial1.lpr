Program TPGrupoX;
Uses
     sysutils;
Type
     str70= string[70];

	 persona = record
        DNI: longint;
	    nombre_apellido: str70;
        correo:str70;
	    pago:str70;
     end;

	fecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end;

    entrada= record
		codigo: longint;
		butaca: 1..100;
		fila: 1..10;
		precio: real;
		fecha_show: fecha;
        platea: 'A'..'K';
		comprador: persona;
     end;

	 lista = ^nodoLista;
     nodoLista = record
	    dato: entrada;
	    sig: lista;
     end;

	 nombres= array [1..20] of str70;
     plateas= array [1..11] of char;
	 dias= array [1..10] of integer;

     {Completar con los tipos de datos necesarios}

     fecha_pago = record
            fecha_show:fecha;
            pago:str70;
     end;


     a_entrada = record
            codigo:longint;
            butaca:1..10;
            fila:1..10;
            precio:real;
            platea:'A'..'K';
            fechaPago:fecha_pago;
     end;

     listaEntradas= ^nodoEntradas;
     nodoEntradas = record
            dato:a_entrada;
            sig:listaEntradas;
     end;

     a_comprador = record
            DNI:longint;
            nombre_apellido:str70;
            correo:str70;
            entradas:listaEntradas;
     end;

     arbolCompradores = ^nodoArbolCompradores;
     nodoArbolCompradores = record
            dato: a_comprador;
            HI:arbolCompradores;
            HD:arbolCompradores;
     end;

     minEntrada=record
            cod:longint;
            but:integer;
            fil:integer;
            pla:char;
     end;

procedure cargarFecha(var f: fecha);
var
v:dias;
pos:integer;
begin
  v[1]:=3;
  v[2]:=4;
  v[3]:=6;
  v[4]:=8;
  v[5]:=9;
  v[6]:=12;
  v[7]:=15;
  v[8]:=16;
  v[9]:=17;
  v[10]:=18;
  pos:=random(10)+1;
  f.dia:=v[pos];
  f.mes := 8;
  f.anio:=2023;
end;

Procedure agregar(var l: lista; e: entrada);
var
      aux: lista;
begin
     new(aux);
     aux^.dato := e;
     aux^.sig := l;
     l:= aux;
end;

procedure cargarComprador(var p: persona);
var
   pos: integer;
   v,v2,v3: nombres;
begin
	{Nombres}
     v[1]:='Lionel Perez';
     v[2]:='Martin Fernandez';
     v[3]:='Mariano Gomez';
     v[4]:='Alejandro Gonzalez';
     v[5]:='Fermin Martinez';
     v[6]:='Nicolas Castro';
     v[7]:='Gonzalo Villareal';
     v[8]:='Tadeo Pardo';
     v[9]:='Juan Pablo Silvestre';
     v[10]:='Mariano Tello';
     v[11]:='Alejo Ruiz';
     v[12]:='Agustin Paz';
     v[13]:='Juan Salto';
     v[14]:='Matias Pidone';
     v[15]:='Luis Hernandez';
     v[16]:='Cristian Herrera';
     v[17]:='Santiago Manzur';
     v[18]:='Julian Darino';
     v[19]:='Victor Abila';
     v[20]:='Luciano Segura';
	 {Correos}
	 v2[1]:='lionel.perez@gmail.com';
     v2[2]:='martin.fernandez@gmail.com';
     v2[3]:='mariano.gomez@gmail.com';
     v2[4]:='alejandro.gonzalez@gmail.com';
     v2[5]:='fermin.martinez@gmail.com';
     v2[6]:='nicolas.castro@gmail.com';
     v2[7]:='gonzalo.villareal@gmail.com';
     v2[8]:='tadeo.pardo@gmail.com';
     v2[9]:='juan.pablo.silvestre@gmail.com';
     v2[10]:='mariano.tello@gmail.com';
     v2[11]:='alejo.ruiz@gmail.com';
     v2[12]:='agustin.paz@gmail.com';
     v2[13]:='juan.salto@gmail.com';
     v2[14]:='matias.pidone@gmail.com';
     v2[15]:='luis.hernandez@gmail.com';
     v2[16]:='cristian.herrera@gmail.com';
     v2[17]:='santiago.manzur@gmail.com';
     v2[18]:='julian.darino@gmail.com';
     v2[19]:='victor.abila@gmail.com';
     v2[20]:='luciano.segura@gmail.com';
	 {Método de pago}
	 v3[1]:='Tarjeta de Credito';
     v3[2]:='Tarjeta de Debito';
     v3[3]:='Efectivo';

   with(p) do begin
	  DNI := random(18000000)+20000000;
	  pos:= random(20)+1;
	  nombre_apellido:= v[pos];
	  correo:= v2[pos];
	  pago:=v3[random(3)+1];
   end;
end;

procedure crearLista(var l: lista);
var
   e: entrada;
   cant,i,j,pos,repe: integer;
   v: plateas;
begin
     cant := random(100)+1;
     v[1]:= 'A';
     v[2]:= 'B';
     v[3]:= 'C';
     v[4]:= 'D';
     v[5]:= 'E';
     v[6]:= 'F';
     v[7]:= 'G';
     v[8]:= 'H';
     v[9]:= 'I';
     v[10]:= 'J';
     v[11]:= 'K';
     for i:=1 to cant do
     begin
          with(e) do begin
               codigo:= random (100000)+1;
               butaca:=random (100)+1;
			   fila:=random (10)+1;
			   pos:= random(11)+1;
			   platea:=v[pos];
			   precio:=random(75000)+10000;
			   cargarFecha(fecha_show);
               cargarComprador(comprador);
          end;
          agregar(l, e);
          repe:=random(3)+1;
          if(repe>2)then
          begin
          for j:=1 to repe do
          begin
               with(e) do begin
               codigo:= random (100000)+1;
               butaca:=random (100)+1;
			   fila:=random (10)+1;
			   pos:= random(11)+1;
			   platea:=v[pos];
			   precio:=random (75000)+10000;
			   cargarFecha(fecha_show);
               end;
              agregar(l, e);
          end;
          end;
       end;
end;


procedure imprimirComprador(p: persona);
begin
     with (p) do begin
          writeln('COMPRADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | CORREO: ', correo, ' | PAGO: ', pago);
     end;
end;

procedure imprimir(e: entrada);
begin
     with (e) do begin
          writeln('');
          writeln('ENTRADA: ', codigo, ' | BUTACA: ',butaca, ' | FILA: ', fila, ' | PLATEA: ', platea, ' | precio: ', precio:0:2, ' | FECHA: ', fecha_show.dia,'/',fecha_show.mes,'/',fecha_show.anio);
          imprimirComprador(comprador);
     end;
end;

procedure imprimirLista(l: lista);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;


{---------------------------------------------------------------------------}
procedure cargarEntradasPorFecha(var pri:listaEntradas; e:entrada);
var
   nue, anterior, actual: listaEntradas;
begin
     new (nue);
     nue^.dato.codigo := e.codigo;
     nue^.dato.butaca := e.butaca;
     nue^.dato.fila := e.fila;
     nue^.dato.platea := e.platea;
     nue^.dato.precio := e.precio;
     nue^.dato.fechaPago.fecha_show := e.fecha_show;
     nue^.dato.fechaPago.pago := e.comprador.pago;
     nue^.sig := nil;
     if (pri = nil) then
          pri := nue
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato.fechaPago.fecha_show.dia < nue^.dato.fechaPago.fecha_show.dia) do begin
               anterior := actual;
               actual:= actual^.sig;
          end;
          if (anterior = actual) then
               pri := nue
          else
               anterior^.sig := nue;
          nue^.sig := actual;
     end;
end;

Procedure cargarEntradas(var l: listaEntradas; e:entrada);
var
   nue: listaEntradas;
begin
     new (nue);
     nue^.dato.codigo := e.codigo;
     nue^.dato.butaca := e.butaca;
     nue^.dato.fila := e.fila;
     nue^.dato.platea := e.platea;
     nue^.dato.precio := e.precio;
     nue^.dato.fechaPago.fecha_show := e.fecha_show;
     nue^.dato.fechaPago.pago := e.comprador.pago;
     nue^.sig := l;
     l:= nue;
end;

Procedure insertarArbol(var a:arbolCompradores; e: entrada);
begin
     if(a=NIL)then
     begin
         new(a);
         a^.dato.DNI:=e.comprador.DNI;
         a^.dato.nombre_apellido:=e.comprador.nombre_apellido;
         a^.dato.correo:=e.comprador.correo;
         a^.dato.entradas:=nil;
         cargarEntradas(a^.dato.entradas,e);
         a^.HI:=nil;
         a^.HD:=nil;
     end
     else
         if (a^.dato.DNI>e.comprador.DNI)then
             insertarArbol(a^.HI,e)
         else
             if(a^.dato.DNI<e.comprador.DNI)then
                 insertarArbol(a^.HD,e)
             else
                 cargarEntradas(a^.dato.entradas,e);
end;

Procedure CrearArbol (l:lista;var a:arbolCompradores);
begin
     while (l<>nil) do begin
          insertarArbol(a,l^.dato);
          l:=l^.sig;
     end;
end;

Procedure inicializarMinEntrada(var m:minEntrada);
begin
     m.cod:=-1;
     m.but:=-1;
     m.fil:=-1;
     m.pla:='1';
end;

Procedure imprimirComprador_5_noches (c: a_comprador);
var
   minE1:minEntrada;
   minE2:minEntrada;
   minPrecio1:real;
   minPrecio2:real;
   aux:listaEntradas;
begin
     minPrecio1:=-1;
     inicializarMinEntrada(minE1);
     inicializarMinEntrada(minE2);
     aux:=c.entradas;
     while (aux<>nil)do begin
          if (aux^.dato.fechaPago.fecha_show.dia>=3)and(aux^.dato.fechaPago.fecha_show.dia<=5)then begin
                  if (aux^.dato.precio>minPrecio1)then begin
                     minPrecio2:=minPrecio1;
                     minE2:=minE1;
                     minPrecio1:= aux^.dato.precio;
                     minE1.fil:=aux^.dato.fila;
                     minE1.but:=aux^.dato.butaca;
                     minE1.cod:=aux^.dato.codigo;
                     minE1.pla:=aux^.dato.platea;
                  end
                  else begin
                       if (aux^.dato.precio>minPrecio2)then begin
                          minPrecio2:= aux^.dato.precio;
                          minE2.fil:=aux^.dato.fila;
                          minE2.but:=aux^.dato.butaca;
                          minE2.cod:=aux^.dato.codigo;
                          minE2.pla:=aux^.dato.platea;
                       end;
                  end;
          end;
          aux:=aux^.sig;
     end;
     if (minPrecio1<>-1)then begin
        writeln('');
        writeln('DNI: ',c.DNI);
        writeln('1º Entrada codigo: ',minE1.cod,' butaca: ',minE1.but,' fila: ',minE1.fil,' platea: ',minE1.pla);
        if (minPrecio2<>-1)then begin
           writeln('2º Entrada codigo: ',minE2.cod,' butaca: ',minE2.but,' fila: ',minE2.fil,' platea: ',minE2.pla);
        end;
     end;
end;


Procedure cantidadEnEfectivo(e:listaEntradas ; var cant:integer);
var
   filaEntrada:integer;
begin
     cant:=0;
     while (e<>nil) do begin
          if (e^.dato.fila>4) and (e^.dato.fila<11)then
                  if (e^.dato.fechaPago.pago = 'Efectivo')then cant:=cant+1;
          e:=e^.sig;
     end;
end;

Procedure imprimirFilas5y10(a:arbolCompradores);
var
   inf:longint;
   sup:longint;
   cant:integer;
begin
  inf:=18000000;
  sup:=32000000;
  if (a <> nil) then begin
    writeln('');
    if (a^.dato.DNI >= inf) then begin
      if (a^.dato.DNI <= sup) then begin
        writeln('DNI: ',a^.dato.DNI);
        writeln('Correo Electronico: ',a^.dato.correo);
        cantidadEnEfectivo(a^.dato.entradas,cant);
        writeln('Cantidad de entradas adquiridas en efectivo: ',cant);
        imprimirFilas5y10(a^.hi);
        imprimirFilas5y10 (a^.hd);
      end
      else
        imprimirFilas5y10(a^.hi)
    end
    else
      imprimirFilas5y10(a^.hd);
  end;
end;

Procedure procesarEntradasVIP (e:listaEntradas;var cant:integer;var credito:boolean; var tot:real);
begin
    while (e<>nil)do begin
         if(e^.dato.fechaPago.pago = 'Tarjeta de Credito') then credito:=true;
         if (e^.dato.platea = 'A') or (e^.dato.platea = 'B') then cant:=cant+1;
         tot:=tot+e^.dato.precio;
         e:=e^.sig;
    end;
end;

Procedure retornarVIP (a:arbolCompradores;var nombre:string; var gasto:real;var entradasMax:integer;var creditoMax:boolean);
var
   cantEntradas:integer;
   credito:boolean;
   tot:real;
begin
if(a<>nil)then
begin
 cantEntradas:=0;
 tot:=0;
 credito:=false;
 procesarEntradasVIP(a^.dato.entradas,cantEntradas,credito,tot);
 if (cantEntradas>entradasMax) and (credito)then begin
     entradasMax:=cantEntradas;
     creditoMax:=true;
     nombre:=a^.dato.nombre_apellido;
     gasto:=tot;
     end;
 retornarVIP(a^.HI,nombre,gasto,entradasMax,creditoMax);
 retornarVIP(a^.HD,nombre,gasto,entradasMax,creditoMax);
 end;
end;

Procedure compradorVIP (a:arbolCompradores;var nombre:string; var gasto:real);
var
   entradasMax:integer;
   creditoMax:boolean;
begin
     gasto:=0;
     entradasMax:=0;
     creditoMax:=false;
     retornarVIP (a,nombre,gasto,entradasMax,creditoMax);
end;


Procedure enOrden( a: arbolCompradores );
begin
if ( a <> nil ) then begin
  enOrden (a^.HI);
  imprimirComprador_5_noches(a^.dato);
  enOrden (a^.HD);
end;
end;
{---------------------------------------------------------------------------}
var
   l: lista;
   a:arbolCompradores;
   nombre:string;
   gasto:real;
begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automatica de la estructura disponible}
     writeln ('LISTA GENERADA: ');
     imprimirLista(l);

     {Completar el programa}
     a:=nil;
     CrearArbol (l,a);


     writeln('');
     writeln('Arbol Creado');
     readln;
     enOrden(a);

     writeln('');
     readln;
     imprimirFilas5y10(a);

     writeln('');
     readln;
     compradorVIP(a,nombre,gasto);
     writeln('El Comprador Vip es');
     writeln('Nombre: ',nombre);
     writeln('Gasto: ',gasto:2:2);

     writeln('Fin del programa');
     readln;
end.
