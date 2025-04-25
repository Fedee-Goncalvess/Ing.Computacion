{Realizar un programa, con la declaración de tipos correspondientes que permita
crear un archivo de registros no ordenados con información de especies de flores
originarias de América. La información será suministrada mediante teclado. De
cada especie se registra: número de especie, altura máxima, nombre científico,
nombre vulgar, color y altura máxima que alcanza. La carga del archivo debe
finalizar cuando se reciba como nombre científico: ’zzz’.
Además se deberá contar con opciones del programa que posibiliten:
a) Reportar en pantalla la cantidad total de especies y la especie de menor y de
mayor altura a alcanzar.
b) Listar todo el contenido del archivo de a una especie por línea.
c) Modificar el nombre científico de la especie flores cargada como: Victoria
amazonia a: Victoria amazónica.
d) Añadir una o más especies al final del archivo con sus datos obtenidos por
teclado. La carga finaliza al recibir especie “zzz”.
e) Listar todo el contenido del archivo, en un archivo de texto llamado “flores.txt”.
El archivo de texto se tiene que poder reutilizar.
f) ¿Qué cambiaría en la escritura del archivo de texto si no fuera necesario
utilizarlo?}

program Ej5;

type
  flor = Record
    num : integer;
    max_altura:integer;
    nombre_cientifico:string;
    nombre_vulgar:string;
    color:string;
  end;

  archivo_flor : file of flor;

procedure imprimirTerminal();
begin
    writeln('Ingrese la operación a realizar');
    writeln('1. Cargar registro de flor');
    writeln('2. Reporte General');
    writeln('3. Listar Contenido');
    writeln('4. Modificar "Victoria" a "Victoria Amazónica');
    writeln('5. Añadir una o más especies');
    writeln('6. Listar archivo en un flores.txt');
    writeln('0. Terminar programa');
end;

procedure reportarPantalla();
begin
    
end;

var
  nombreArchivo : string;
  archivo : archivo_flor;
  entrada_string : string;
  entrada_int : integer;
  op : integer;

  entrada : flor;

begin
  
  imprimirTerminal();
  readln(op);
  while op <> 0 do
    begin
        case op of
            1 : begin
            
            end;
            2 : begin
        
            end;
            3 : begin
        
            end; 
            4 : begin
        
            end;
            5 : begin
        
            end;
            6 : begin
        
            end;           
            else begin
            writeln('Operación no encontrada.');
            end;
        end;
        imprimirTerminal();
        readln(op);

    end;
    writeln('Finalizando el programa...');

end.