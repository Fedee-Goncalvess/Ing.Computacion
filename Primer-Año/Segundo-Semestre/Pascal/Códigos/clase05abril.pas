{ Implementar un programa que lea una secuencia de caracteres que termina en punto. 
Se debe informar la cantidad de veces que aparece cada letra minúscula en la secuencia.}

program clase05deabril;

type rango = 'a'..'z';
     vector = array [rango] of integer;

procedure Inicializar (var v: vector);
var i: rango;
begin
  for i:= 'a' to 'z' do
    v [i]:= 0;
end;

procedure ProcesarSecuencia (var v: vector);
const fin = '.';
type conjunto = set of rango;
var car: char;
    minusculas: conjunto;
begin
  minusculas:= ['a'..'z'];
  write ('Ingrese un caracter: ');
  readln (car);
  while (car <> fin) do
  begin
    if (car in minusculas) then v [car]:= v [car] + 1;
    write ('Ingrese un caracter: ');
    readln (car);
  end;
end;

procedure Informar (v: vector);
var i: rango;
begin
  for i:= 'a' to 'z' do
    writeln ('La letra ', i, ' aparece ', v [i], ' veces');
end;


var v: vector;

begin
  Inicializar (v);
  ProcesarSecuencia (v);
  Informar (v);
end.
