Program twitterAgrupados;
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

     tweetUsuario = record
                  mensaje:string;
                  esRetweet:boolean;
     end;

     listaTweetsUsuario=^nodoTweetsUsuario;
     nodoTweetsUsuario = record
               dato:tweetUsuario;
               sig:listaTweetsUsuario;
               end;

     Usuario = record
               codigoUsuario:integer;
               nombreUsuario:string;
               tweets:listaTweetsUsuario;
     end;

     listaUsuarios = ^nodoUsuarios;
     nodoUsuarios=record
               dato:Usuario;
               sig:listaUsuarios;
     end;

Procedure agregarTweetdeUsuario (var Lista:listaTweetsUsuario;T:tweet);
var
   aux:listaTweetsUsuario;
   L:listaTweetsUsuario;
begin
     new (aux);
     aux^.dato.mensaje:=T.mensaje;
     aux^.dato.esRetweet:=T.esRetweet;
     aux^.sig:=nil;
     if (Lista=nil) then begin
          Lista:=aux;
     end
     else
         begin
              L:=Lista;
              while (L^.sig<>nil) do begin
                   L:=L^.sig;
              end;
              L^.sig:=aux;
         end;
end;
Procedure agregarAtrasListaUsuarios (var ListaUser:listaUsuarios;T:tweet);
var
      aux:listaUsuarios;
      L:listaUsuarios;
begin
     new (aux);
     aux^.dato.nombreUsuario:=T.nombreUsuario;
     aux^.dato.codigoUsuario:=T.codigoUsuario;
     aux^.dato.tweets:=nil;
     aux^.sig:=nil;
     agregarTweetdeUsuario(aux^.dato.tweets,T);
     if (ListaUser=nil) then begin
          writeln('Primer Usuario');
          ListaUser:=aux;
     end
     else
         begin
              new (L);
              L:=ListaUser;
              while (L^.sig<>nil)do begin
                    L:=L^.sig;
                    end;
              if (L^.dato.codigoUsuario = T.codigoUsuario) then  begin
                 writeln('Mismo usuario');
                 agregarTweetdeUsuario(L^.dato.tweets,T)
              end
              else
                  begin
                       writeln('Nuevo Usuario');
                       L^.sig:=aux;
                  end;
         end;
end;
Procedure recorrerMensajes (L:listaTweetsUsuario);
begin
     while (L<>nil)do begin
          writeln(L^.dato.mensaje,' Es Retweet: ',L^.dato.esRetweet);
          L:=L^.sig
     end;
end;

Procedure imprimirListaAgrupada(L:listaUsuarios);
var
      nombreActual:String;
      listaTweets:listaTweetsUsuario;
begin
     while (L<>nil) do begin
          writeln('');
          writeln('Tweets de Usuario: ',L^.dato.nombreUsuario);
          recorrerMensajes (L^.dato.tweets);
          L:=L^.sig;
          end;
end;

Procedure AgruparTweets (ListaOrdenada:listaTweets;var ListaUser:listaUsuarios);
Begin
     While (ListaOrdenada<>nil) do begin
          agregarAtrasListaUsuarios (ListaUser,ListaOrdenada^.dato);
          ListaOrdenada:=ListaOrdenada^.sig;
          end;
End;

     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}

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


var
   l, l_ordenada: listaTweets;
   l_usuarios: listaUsuarios;
Begin
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
     l_usuarios:=nil;
     AgruparTweets (l_ordenada,l_usuarios);
     imprimirListaAgrupada(l_usuarios);

     writeln('Fin del programa');
     readln;
end.
