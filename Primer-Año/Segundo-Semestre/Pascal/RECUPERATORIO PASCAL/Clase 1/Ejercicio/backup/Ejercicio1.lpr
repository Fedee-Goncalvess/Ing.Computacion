Program Ejercicio1;
Uses
     sysutils;
Type
     producto = record
          codigo: integer;
	      nombre: string;
	      marca: string;
	      anio: 2000..2022;
		  precio: real;
     end;

     listaProductos = ^nodoLista;
     nodoLista = record
               dato: producto;
               sig: listaProductos;
     end;

     datoListaProds=record
               codigo:integer;
               nombre:string;
               precio:real;
     end;

     listaProds=^nodoListaProds;
     nodoListaProds=record
               dato:datoListaProds;
               sig:listaProds;
     end;

     datoListaAnio=record
               anio:2000..2022;
               lista:listaProds;
     end;

     listaAnio=^nodoAnio;
     nodoAnio=record
               dato: datoListaAnio;
               sig:listaAnio;
     end;

     datoListaMarca=record
               marca:string;
               lista:listaAnio;
     end;

     listaMarcas=^nodoMarca;
     nodoMarca=record
               dato: datoListaMarca;
               sig: listaMarcas;
     end;
Procedure agregarAlFinalProducto (var L2:listaProds;Prod:producto);
var
   nue:listaProds;
   aux:listaProds;
begin
   new (nue);
   nue^.dato.codigo:=Prod.codigo;
   nue^.dato.nombre:=Prod.nombre;
   nue^.dato.precio:=Prod.precio;
   nue^.sig:=nil;
   if (L2=nil) then begin
      L2:=nue;
   end
   else begin
        aux:=L2;
        while (aux^.sig<>nil)do begin
                aux:=aux^.sig;
        end;
        aux^.sig:=nue;
   end;
end;

Procedure agregarAnio (var L2:listaAnio;Prod:producto);
var
   nue:listaAnio;
   aux:listaAnio;
begin
   new (nue);
   nue^.dato.anio:=Prod.anio;
   nue^.dato.lista:=nil;
   agregarAlFinalProducto(nue^.dato.lista,Prod);
   nue^.sig:=nil;
   if (L2=nil) then begin
      L2:=nue;
   end
   else begin                                     {<---Aca esta el problem pichicho}
        aux:=L2;
        while (aux^.sig<>nil)do begin
                aux:=aux^.sig;
        end;
        aux^.sig:=nue;
   end;
end;

Procedure agregarMarca (var L2:listaMarcas;Prod:producto);
var
   nue:listaMarcas;
begin
   new (nue);
   nue^.dato.marca:=Prod.marca;
   nue^.dato.lista:=nil;
   agregarAnio(nue^.dato.lista,Prod);
   nue^.sig:=nil;
   if (L2=nil)then begin
      L2:=nue;
   end
   else begin
        L2^.sig:=nue;
   end;
end;





Procedure agregar_L1_L2 (var L2:listaMarcas;Prod:producto);
var
   nue:listaMarcas;
   aux:listaMarcas;
   aux2:listaAnio;
   marcaActual:string;
   anioActual:integer;
begin
   if (L2=nil)then begin
      agregarMarca(L2,Prod);
   end
   else begin
        aux:=L2;
        while (aux^.sig<>nil)do begin
                aux:=aux^.sig;
        end;
        marcaActual:= aux^.dato.marca;
        if (marcaActual=Prod.marca)then begin
           aux2:=aux^.dato.lista;
           {------------------------------}
           while (aux2^.sig<>nil) do begin
                aux2:=aux2^.sig;
           end;
           anioActual:=aux2^.dato.anio;
           if (anioActual=Prod.anio)then begin
              agregarAlFinalProducto(aux2^.dato.lista,Prod);
           end
           else begin
                agregarAnio(aux^.dato.lista,Prod);        {<---Aca esta el problem pichicho}
                end;
            {------------------------------}
        end
        else begin
                agregarMarca (aux,Prod);
        end;
   end;
end;

Procedure CrearListaDeListas2 (L1:listaProductos;var L2:listaMarcas);
var
   aux:listaMarcas;
begin
   while (L1<>nil) do begin
        if (L2=nil)then begin
           agregar_L1_L2(L2,L1^.dato);
        end
        else begin
             aux:=L2;
             while (aux^.sig<>nil)do begin
                  aux:=aux^.sig;
             end;
             agregar_L1_L2(aux,L1^.dato);   {<---Aca esta el problem pichicho}
        end;
        L1:=L1^.sig;
   end;
end;
Procedure ImprimirListaProds (L:listaProds);
begin
   while (L<>nil)do begin
        writeln('        Codigo: ',L^.dato.codigo);
        writeln('        Nombre: ',L^.dato.nombre);
        writeln('        Precio: ',L^.dato.precio:2:2);
        writeln('        -----------------');
        L:=L^.sig;
   end;
end;

Procedure ImprimirListaAnios (L:listaAnio);
var
   cant:integer;
begin
   cant:=1;
   while (L<>nil) do begin
        writeln('    Anio: ',L^.dato.anio);

        cant:=cant+1;
        ImprimirListaProds(L^.dato.lista);
        L:=L^.sig;
   end;
   writeln('cantidad de nodos de Anio: ',cant);
end;

Procedure ImprimirListaMarcas (L:listaMarcas);
begin
   while (L<>nil)do begin
        writeln('Marca: ',L^.dato.marca);
        ImprimirListaAnios(L^.dato.lista);
        writeln('');
        writeln('Se imprimió una marca.');
        readln();
        L:=L^.sig;
   end;
end;

Procedure agregarAdelante(var l: listaProductos; p: producto);
var
   aux: listaProductos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con productos aleatorios}
procedure crearLista(var l: listaProductos);
var
   i,j:integer;
   p: producto;

   v : array [1..10] of string;
begin
     v[1]:= 'Abercom';
     v[2]:= 'Aluminium';
     v[3]:= 'ClearWindows';
     v[4]:= 'IndArg';
     v[5]:= 'La Foret';
     v[6]:= 'Open';
     v[7]:= 'Portal';
     v[8]:= 'Puertamania';
     v[9]:= 'PVCPremium';
     v[10]:= 'Ventalum';

	 for i:=random(10) downto 1 do {for de marca}
	 begin
	     p.marca:= v[i];
		 for j:=random(5) downto 1 do {for de anio}
	     begin
		 	p.anio:= 2016+j;
			p.codigo:= random(10);
			while (p.codigo <> 0) do Begin
				p.nombre:= Concat('Producto-', IntToStr(random (200)));
				p.precio := random(1000000);
				agregarAdelante(l, p);
                p.codigo:= random(10);
		   end;
		 end;
	 end;
end;


{imprimir - Muestra en pantalla el producto}
procedure imprimir(p: producto);
begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaProductos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

var
   l: listaProductos;
   l2:listaMarcas;
begin
     Randomize;

     l:= nil;   {Ordenada 1ºMarca 2ºaño}
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     readln;
     l2:=nil;
     CrearListaDeListas2(l,l2);
     ImprimirListaMarcas(l2);
     readln();
end.
