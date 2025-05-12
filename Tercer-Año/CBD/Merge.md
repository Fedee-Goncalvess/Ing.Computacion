
--

---
**Este algoritmo utiliza [[Leer]] y [[Mínimo]]
# Resumen
Dado n archivos detalle, se actualiza un archivo maestro  ordenado por un atributo específico.

Se deben definir estos types:
- Records de archivo Detalle y Maestro
- Archivos de ambos records 
- Array de archivo detalle 
- Array de Records detalle

La idea es, tener un array de los archivos detalle para poder buscar en estos. Lo ideal es sabiendo qué orden tiene el archivo maestro (ejemplo ordenado por número), buscamos en cada archivo detalle, el record con número más bajo y lo guardamos en un array del mismo tamaño que cantidad de archivos detalle. Este array funcionará de **buffer** para que nosotros actualicemos el archivo maestro en el orden que está este.
N=5

| d1    | d2    | d3    | d4    | d5    |
| ----- | ----- | ----- | ----- | ----- |
| R1-08 | R2-01 | R3-15 | R4-03 | R5-09 |
Queremos actualizar el archivo maestro -> Buscamos el record con número bajo en el array
(R2-01). Lo actualizamos en el maestro, y luego debemos encontrar el siguiente record con número bajo de ese mismo archivo detalle.

| d1    | d2    | d3    | d4    | d5    |
| ----- | ----- | ----- | ----- | ----- |
| R1-08 | R2-05 | R3-15 | R4-03 | R5-09 |
Repetimos buscando en el array el record con número bajo (R4-03)


| d1    | d2    | d3    | d4      | d5    |
| ----- | ----- | ----- | ------- | ----- |
| R1-08 | R2-01 | R3-15 | **EOF** | R5-09 |
Hacemos esto hasta que terminemos todos los archivos detalle

---

## 🔹 **Pseudocódigo para un Merge Generalizado**

### **1️⃣ Inicialización:**

- Abrir el archivo maestro en modo lectura/escritura *(reset)*.
- Abrir los archivos detalle en modo lectura.
- Crear un array para almacenar los registros actuales de cada archivo detalle.
- Leer el primer registro de cada archivo detalle.

### **2️⃣ Encontrar el mínimo:**

- Definir una función `ObtenerMinimo` para identificar el registro de detalle con el menor valor de la clave (ej: `codEmpleado`).    
- Actualizar el array de registros con el próximo valor del archivo correspondiente al mínimo.

### **3️⃣ Proceso de actualización:**

- Mientras el mínimo obtenido sea distinto de un valor máximo definido (`VALOR_ALTO`):
    
    - Leer el siguiente registro del archivo maestro.
    - Si el código del maestro es menor al código del mínimo:
        - Escribir el registro del maestro en el archivo.
        - Leer el siguiente registro del maestro.
    - Si los códigos coinciden:
        - Inicializar un acumulador para los valores que se desean actualizar (ej: `diasSolicitados`).
        - Mientras los códigos coincidan, acumular el valor y llamar a `ObtenerMinimo` para el siguiente registro.
        - Si el valor en el maestro permite la actualización:
            - Actualizar el maestro con el valor acumulado.
        - En caso contrario:
            - Registrar el error o rechazo en un archivo de log (ej: `rechazados.txt`).
        - Escribir el registro actualizado en el archivo maestro.

### **4️⃣ Cierre de archivos:**

- Cerrar el archivo maestro.
- Cerrar los archivos detalle.
- Cerrar el archivo de log de rechazos si se generó.

### **5️⃣ Funciones auxiliares:**

- **Leer:** Lee un registro del archivo, si es fin de archivo, asigna un valor máximo a la clave.
- **ObtenerMinimo:** Busca el registro con menor valor de clave entre los registros actuales de los detalles y actualiza ese índice con un nuevo valor del archivo correspondiente.

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
1. Mientras no terminen los tres archivos
	1. Guarda el código y precio del mínimo en prod
	2. Inicializa la cantidad acumulada en 0
	3. Mientras sigan apareciendo productos con el mismo código, suma las cantidades.
	4. Cuando cambia código, guarda el producto acumulado en el maestro.
2. Cierra el archivo maestro
3. Finalmente cierra los 3 archivos que se querían fusionar
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