Program twitter;
Uses
     sysutils;
Type
     tweet = record
	      codigoUsuario: integer;
	      nombreUsuario: string;
	      mensaje: string;
	      esRetweet: boolean;
     end;

     listaTweets = ^nodoLista;
     nodoLista = record
               dato: tweet;
               sig: listaTweets;
     end;

     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}

     tweetTxt = record
               mensaje: string;
               esRetweet: boolean;
     end;

     sbListaTweets = ^nodoSbLista;
     nodoSbLista = record
               dato: tweetTxt;
               sig:sbListaTweets;
     end;

     Usuario = record
               CodigoUsuario:integer;
               nombreUsuario:string;
               pTweets: sbListaTweets;
     end;

     ListaUsuario = ^NodoUsuario;

     NodoUsuario = record
            dato:Usuario;
            sig:ListaUsuario;
     end;

{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
   v : array [1..10] of string;
begin
     v[1]:= 'juan';
     v[2]:= 'pedro';
     v[3]:= 'carlos';
     v[4]:= 'julia';
     v[5]:= 'mariana';
     v[6]:= 'gonzalo';
     v[7]:='alejandro';
     v[8]:= 'silvana';
     v[9]:= 'federico';
     v[10]:= 'ruth';

     t.codigoUsuario := random(11);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(v[t.codigoUsuario], '-mensaje-', IntToStr(random (200)));
          t.nombreUsuario := v[t.codigoUsuario];
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(11);
     end;
end;


{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;


{agregarElemento - Resuelve la inserción de la estructura ordenada}
procedure agregarOrdenado(var pri:listaTweets; t:tweet);
var
   nuevo, anterior, actual: listaTweets;
begin
     new (nuevo);
     nuevo^.dato:= t;
     nuevo^.sig := nil;
     if (pri = nil) then
          pri := nuevo
     else
     begin
          actual := pri;
          anterior := pri;
          while (actual<>nil) and (actual^.dato.nombreUsuario < nuevo^.dato .nombreUsuario) do begin
               anterior := actual;
               actual:= actual^.sig;
          end;
          if (anterior = actual) then
               pri := nuevo
          else
               anterior^.sig := nuevo;
          nuevo^.sig := actual;
     end;
end;


{generarNuevaEstructura - Resuelve la generación estructura ordenada}
procedure generarNuevaEstructura (lT: listaTweets; VAR listaOrdenada: listaTweets);
begin
     listaOrdenada := nil;
     while(lT <> nil) do begin
          agregarOrdenado(listaOrdenada, lT^.dato);
          lT := lT^.sig;
     end;
end;

Procedure AgregarAdelante2(var L_Usuario: ListaUsuario; nombre:string; codigo: integer);
var
   aux: ListaUsuario;
begin
     new(aux);
     aux^.dato.nombreUsuario := nombre;
     aux^.dato.CodigoUsuario:= codigo;
     aux^.sig := L_Usuario;
     L_Usuario:= aux;
end;

Procedure AgregarAdelante3(var L_tweets:sbListaTweets;es_rt:boolean;txt:string);
var
   aux: sbListaTweets;
begin
     new(aux);
     aux^.dato.mensaje := txt;
     aux^.dato.esRetweet := es_rt;
     aux^.sig := l_tweets;
     L_tweets:= aux;
end;

procedure Recorrer (l_ordenada: listaTweets; var L_usuario:ListaUsuario); //tal vez haya que devolver var exito
var
   L_tweets_aux:sbListaTweets;
   actual_user:string;
begin
     L_usuario:= nil;
     while (l_ordenada <> nil) do begin

           L_tweets_aux:=nil;
           actual_user :=l_ordenada^.dato.nombreUsuario;
           AgregarAdelante2(L_usuario,l_ordenada^.dato.nombreUsuario,l_ordenada^.dato.codigoUsuario);

           while (l_ordenada <> nil) and (actual_user=l_ordenada^.dato.nombreUsuario) do begin

                 AgregarAdelante3(L_tweets_aux,l_ordenada^.dato.esRetweet,l_ordenada^.dato.mensaje);
                 l_ordenada:=l_ordenada^.sig;

           end;
           L_usuario^.dato.pTweets:=L_tweets_aux; //no utilizar puntero auxiliar, usar pTweets y ponerlo nil

     end;

end;

var
   l, l_ordenada: listaTweets;
   L_usuario: ListaUsuario;
begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);

     {Se crea la estructura ordenada}
     l_ordenada:= nil;
     generarNuevaEstructura(l,l_ordenada);
     writeln ('Lista ordenada: ');
     imprimirLista(l_ordenada);

     {Completar el programa}
     Recorrer(l_ordenada,L_usuario);

     writeln('Fin del programa');
     readln;
end.


