program Potencia;

function potencia (x,n:integer):real;
begin
     if (n=0)then
        potencia:=1
     else
       potencia:=  x*potencia(x,n-1);
end;

var
  num,n:integer;
begin
     writeln('Ingresar base');
     read(num);
     writeln('Ingresar potencia');
     read(n);
     writeln(num,' elevado a ',n,' es igual a: ',potencia(num,n):2:2);
     readln(num);
end.

