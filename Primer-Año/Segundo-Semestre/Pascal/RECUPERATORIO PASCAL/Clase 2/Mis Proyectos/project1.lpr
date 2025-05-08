program project1;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

Procedure busquedaDicotomica(var v:vector;pri:integer;ult:integer;num:integer;pos:integer);
var
   medio:integer;
Begin
     if (pri>ult) then pos:=-1
     else begin
        medio:=(pri+ult)div 2;
        if (v[medio]=num) then pos:=medio
        else begin
             if (v[medio]<num) then
                busquedaDicotomica (v,medio+1,ult,num,pos)
             else
                 busquedaDicotomica (v,pri,medio-1,num,pos);
             end;
     end;
End;



{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   num,pos,pri:integer;

begin
     pri:=1;
     cargarVectorOrdenado(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     write('Numero a buscar en el vector: ');
     readln(num);
     busquedaDicotomica(v,pri,diml,num,pos);
     if (pos=-1) then writeln('El numero no existe dentro del vector')
     else writeln('La posicion del numero es: ',pos);
     readln;
end.
