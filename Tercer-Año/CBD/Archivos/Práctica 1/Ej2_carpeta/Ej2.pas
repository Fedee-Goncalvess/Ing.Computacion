{Desarrollar un programa que permita la apertura de un archivo de números enteros
no ordenados. La información del archivo corresponde a la cantidad de votantes
de cada ciudad de la Provincia de Buenos Aires en una elección presidencial.
Recorriendo el archivo una única vez, informe por pantalla la cantidad mínima y
máxima de votantes. Además durante el recorrido, el programa deberá listar el
contenido del archivo en pantalla. El nombre del archivo a procesar debe ser
proporcionado por el usuario.}

program Ej2;

var
    arch : file of integer;
    nombreArchivo : string;
    min : integer;
    max : integer;
    aux : integer;
    i : integer;
begin
    max := 0;
    min := 999;
    i:=0;
    writeln('Ingresar nombre del archivo a abrir');
    readln(nombreArchivo);
    Assign(arch,nombreArchivo);
    Reset(arch);

    writeln('Procesando archivo ',nombreArchivo);
    while (not eof(arch)) do 
        begin
            i:= i+1;
            read(arch,aux);     
            writeln(i,'. ',aux);
            writeln(min);
            if aux > max then
                begin
                    max:=aux;
                end
            else begin
                if aux < min then
                    begin
                        min:=aux;    
                    end;
            end;
                
        end;
    writeln('La cantidad de votos máximos fue de ',max);
    writeln('La cantidad de votos mínimos fue de ',min);    
end.