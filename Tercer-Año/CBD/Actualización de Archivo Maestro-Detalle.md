
---
**Este algoritmo utiliza [[Leer]] 
# Resumen

---
## Explicación
Actualizador de un archivo maestro con un archivo detalle de ventas. Se actualiza el stock de productos en el archivo maestro (`mae`) con las ventas de productos registradas en el archivo detalle (`det`). El programa va leyendo el archivo de ventas (`det`) y actualizando el stock del producto correspondiente en el archivo maestro (`mae`) con la cantidad vendida.

# Definición de Variables y Tipos
## Explicación
Se define una constante con valor alto para indicar el final de archivo. Luego se tiene registro que contiene código de producto, descripción, precio unitario y stock disponible llamado `producto`. 
También se tiene registro que contiene el código del producto y la cantidad vendida llamado `venta_prod`.
Luego se define archivo de ventas llamado `detalle` y archivo de productos llamado `maestro`.
## Código
```pascal
const valoralto = '9999';
type
	str4 = string[4];
	producto = record
		cod: str4;
		descripcion: string[30];
		pu: real;
		stock: integer;
	end;
	
	venta_prod = record
		cod: str4;
		cant_vendida: integer;
	end;
	
	detalle = file of venta_prod;
	maestro = file of producto;
```

# Primer Bloque
## Explicación
Se asignan los archivos maestros y detalles con sus respectivas variables
Se abren los archivos para leer con apertura **reset**
Inicializa el código del registro maestro a `valoralto` como bandera para iniciar el proceso.
Se lee el primer registro del archivo `detalle` con [[Leer]] 
## Código
```pascal
assign(mae, 'maestro');
assign(det, 'detalle');
reset(mae);
reset(det);
regm.cod=valoralto;
leer(det, regd);
```
# Segundo Bloque
**Proceso de Actualización**
## Explicación
1. Primer while procesa todos los registros del archivo `detalle`. Mientras haya productos en el archivo de ventas (`regd.cod <> valoralto`), el programa continúa.
2. `aux := regd.cod` guarda el código del producto actual.
3. `total := 0` reinicia el contador de ventas para el producto actual.
4. Luego, entra en otro `while` donde va sumando la cantidad vendida del producto (`total := total + regd.cant_vendida`) mientras el código del producto en el archivo detalle sea el mismo (`aux = regd.cod`).
5. `leer(det, regd)` lee el siguiente registro de ventas.
## Código
```pascal
while (regd.cod <> valoralto) do begin {Se procesan todos los registros del archivo detalle}
  aux := regd.cod;  // guardamos el código del producto actual
  total := 0;        // reiniciamos el total de ventas de ese producto

  while (aux = regd.cod) do begin {Suma el total vendido para ese producto}
    total := total + regd.cant_vendida;
    leer(det, regd);  // leemos el siguiente registro de ventas
  end;

```
# Tercer Bloque
**Actualización del Maestro **
## Explicación
1. Se busca el producto en el archivo `mae` (maestro) con el código almacenado en `aux`. Si el código del producto (`regm.cod`) no es igual al de `aux`, se sigue leyendo el archivo maestro (`read(mae, regm)`).
2. Una vez que se encuentra el producto, se actualiza el `stock` restando el `total` de la cantidad vendida.
3. Luego, se mueve el puntero del archivo maestro (`seek(mae, filepos(mae)-1)`) para reemplazar el registro correcto en la misma posición.
4. Se guarda el registro actualizado en el archivo maestro con `write(mae, regm)`.

## Código
```pascal
	while (regm.cod <> aux) do  
		read (mae, regm); 
	  
	regm.stock := regm.stock - total;  
	seek(mae, filepos(mae)-1);  
	write(mae, regm);  

	if (not(EOF(mae))) then
		read(mae, regm);  
end;


```
# Cierre de Archivos
## Explicación
Finalmente se cierran los archivos det y mae para liberar los recursos
## Código
```pascal
close(det);
close(mae);

```
# Código Completo

```pascal
const valoralto = '9999';
type
	str4 = string[4];
	producto = record
		cod: str4;
		descripcion: string[30];
		pu: real;
		stock: integer;
	end;
	
	venta_prod = record
		cod: str4;
		cant_vendida: integer;
	end;
	
	detalle = file of venta_prod;
	maestro = file of producto;
	
var
	mae: maestro;
	regm: producto;
	det: detalle;
	regd: venta_prod;
	total: integer;
	aux: str4;
	
procedure leer(var archivo: detalle; var dato: venta_prod);
begin
	if (not(EOF(archivo))) then
		read (archivo, dato)
	else
		dato.cod := valoralto;
end;

begin {programa principal}
	assign(mae, 'maestro');
	assign(det, 'detalle');
	reset(mae);
	reset(det);
	regm.cod=valoralto;
	leer(det, regd);
	while (regd.cod <> valoralto) do begin {Se procesan todos los registros del
	archivo detalle}
		aux := regd.cod;
		total := 0;
		while (aux = regd.cod) do begin {suma el total vendido para = producto}
			total := total + regd.cant_vendida;
			leer(det, regd);
		end;
		while (regm.cod <> aux) do {se busca el producto detalle en el maestro}
			read (mae, regm);
		regm.cant := regm.cant – total; {se modifica el stock del producto
		con la cantidad total vendida de ese producto}
		seek(mae, filepos(mae)-1); {se reubica el puntero en el maestro}
		write(mae, regm); {se actualiza el maestro}
		if (not(EOF(mae))) then
			read(mae, regm);
	end;
	close(det);
	close(mae);
end.
```