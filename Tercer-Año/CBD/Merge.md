
--

---
**Este algoritmo utiliza [[Leer]] y [[Mínimo]]
# Resumen

---
# Desarrollo del Código
## Declaración Type, variables y constantes
- Se define ``valor_alto`` para especificar cuando se termina un archivo.
- Crea registro llamado ``producto`` que representa lo que se vende con código, cantidad, precio unitario.
- Se define archivo de productos ``arc_productos = file of producto;``
- Se define un array de 3 archivos y 3 productos.
### Código
```pascal
const valor_alto = '9999’;

type str4 = string[4];
	producto = record
	codigo: str4;
	pu: real;
	cant: integer;
end;

arc_productos = file of producto;
adet = array[1..3] of arc_productos;
ardet = array[1..3] of producto;

```

## Var
###
```pascal
var
	det:adet;
	rdet:ardet;
	mae: arc_productos;
	min, prod: producto;
```

## Primer Bloque 
### Explicación
1. Se enlaza el archivo maestro con la variable declarada
2. Luego se enlazan los 3 archivos que el usuario escribe para fusionar
3. Se utiliza apertura rewrite para el maestro
4. Se utiliza apertura reset para cada archivo y se lee con [[Leer]]
5. Luego se utiliza [[Mínimo]]

### Código
```pascal
assign (mae, 'maestro’);
	for i:=1 to 3 do begin
		writeln('ESCRIBA UN NOMBRE PARA EL ARCHIVO: ');
		read(nombreDet);
		assign(det[i],nombreDet);
	end;
	rewrite (mae);
	for i:=1 to 3 do begin
		reset (det[i]);
		leer (det[i], regd[i]);
	end
	minimo (det, rdet, min);
```

## Segundo Bloque
### Explicación
1. 
### Código
```pascal
while (min.codigo <> valoralto) do begin
	prod.codigo:= min.codigo;
	prod.pu=min.pu;
	prod.cant := 0;
	while (min.codigo = prod.codigo) do begin
		prod.cant := prod.cant + min.cant;
		minimo (det, rdet, min);
	end;
	write (mae, prod);
end;
close(mae);
for i:=1 to 3 do
	close (det[i])
```

##
###
```
```

## 
###
```
```

## Código Completo

```pascal
program ejemplo;

const valor_alto = '9999’;

type str4 = string[4];
	producto = record
	codigo: str4;
	pu: real;
	cant: integer;
end;

arc_productos = file of producto;
adet = array[1..3] of arc_productos;
ardet = array[1..3] of producto;

var
	det:adet;
	rdet:ardet;
	mae: arc_productos;
	min, prod: producto;

procedure leer (var archivo: arc_productos;
var dato: producto);
begin
	if (not(EOF(archivo))) then
		read (archivo, dato)
	else 
		dato.codigo := valor_alto;
end;

procedure minimo(var det: adet; var rdet:ardet;var min:producto);
Var
	posMin :int
Begin
	posMin:=1;
	min := rdet[1];
	for i:=2 to 3 do
	begin
		if(rdet[i].codigo < min.codigo)then
		begin
			min:= rdet[i];
			posMin:=i;
		end;
	end;
	leer(det[posMin],rdet[posMin]);
end;

begin
	assign (mae, 'maestro’);
	for i:=1 to 3 do begin
		writeln('ESCRIBA UN NOMBRE PARA EL ARCHIVO: ');
		read(nombreDet);
		assign(det[i],nombreDet);
	end;
	rewrite (mae);
	for i:=1 to 3 do begin
		reset (det[i]);
		leer (det[i], regd[i]);
	end
	minimo (det, rdet, min);
	while (min.codigo <> valoralto) do begin
		prod.codigo:= min.codigo;
		prod.pu=min.pu;
		prod.cant := 0;
		while (min.codigo = prod.codigo) do begin
			prod.cant := prod.cant + min.cant;
			minimo (det, rdet, min);
		end;
		write (mae, prod);
	end;
	close(mae);
	for i:=1 to 3 do
		close (det[i])
End.
```