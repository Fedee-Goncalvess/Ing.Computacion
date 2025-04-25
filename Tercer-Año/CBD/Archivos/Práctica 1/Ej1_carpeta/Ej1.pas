{Realizar un programa que permita crear un archivo conteniendo información de
nombres de materiales de construcción, el archivo no es ordenado. Efectúe la
declaración de tipos correspondiente y luego realice un programa que permita la
carga del archivo con datos ingresados por el usuario. El nombre del archivo debe
ser proporcionado por el usuario. La carga finaliza al procesar el nombre ‘cemento’
que debe incorporarse al archivo}

program Ej1;

{$mode delphi}

var
  // Declara tus variables aquí
  arch : Text;
  nombreArchivo : string;
  entrada : string;

begin
  // Código principal
  writeln('Ingrese el nombre del archivo a crear');
  readln(nombreArchivo);
  nombreArchivo := nombreArchivo + '.txt';
  Assign(arch,nombreArchivo);
  Rewrite(arch);

writeln('Ingrese una entrada');
  readln(entrada);
  while (entrada <> 'cemento') do
    begin
      writeln(arch, entrada);
      writeln('Entrada exitosa...');
      writeln('Ingrese siguiente entrada');
      readln(entrada);
    end;
  writeln(arch,entrada);  //se debe agregar cemento al archivo
  writeln('Cerrando archivo...');
  Close(arch);
end.