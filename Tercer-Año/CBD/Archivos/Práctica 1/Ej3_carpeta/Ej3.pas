{3. Realizar un programa que permita crear un archivo de texto. El archivo se debe
cargar con la información ingresada mediante teclado. La información a cargar
representa los tipos de dinosaurios que habitaron en Sudamérica. La carga finaliza
al procesar el nombre ‘zzz’ que no debe incorporarse al archivo.}

program Ej3;

var
    arch : Text;
    nombreArchivo : string;
    entrada : string;
begin
    writeln('Ingrese el nombre del archivo a crear');
    readln(nombreArchivo);
    nombreArchivo:=nombreArchivo+'.txt';

    Assign(arch,nombreArchivo);
    Rewrite(arch);

    writeln('Ingrese una entrada de Dinosaurio');
    readln(entrada);
    while entrada <> 'zzz' do
        begin
            writeln(arch,entrada);
            writeln('Entrada ingresada...');
            writeln('Ingrese una entrada de Dinosaurio');
            readln(entrada);
        end;
    Close(arch);
end.