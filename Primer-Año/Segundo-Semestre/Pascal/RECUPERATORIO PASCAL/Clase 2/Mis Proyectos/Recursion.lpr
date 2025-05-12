program Recursion;

var
  num, maximo: integer;

procedure digitoMaximo(n: integer; var max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo(n, max);
end;

function  digitoMaximoF(n:integer; max:integer):integer;
var
  dig:integer;
begin
  dig:=n mod 10;
  if (dig>max) then
    max:=dig;
  n:=n div 10;
  if (n<>0) then
    digitoMaximoF:=digitoMaximoF(n,max)
  else
    digitoMaximoF:=max;
end;
Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  writeln ( 'El digito maximo del numero ', num, ' con la funcion es: ', digitoMaximoF(num,maximo));
  digitoMaximo (num, maximo);
  writeln ( 'El digito maximo del numero ', num, ' con el procedimiento es: ', maximo);
  readln;
End.

