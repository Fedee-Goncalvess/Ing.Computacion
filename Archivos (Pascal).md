# Tipos de Archivos
- Longitud Fija 
- Unidades Indeterminadas 
- Texto 
# Operaciones
- Asignación (Assign)
		Asocia la ubicación física real del archivo para poder utilizar dicha variable
- Apertura
	- Rewrite
		Crea un archivo con el nombre asignado a la variable para escribir. Si ya existe borra su contenido posicionando al programa al comienzo del archivo.
	- Reset
		Abre un archivo con el nombre asignado a la variable tanto para leer como para escribir. Posiciona el programa al comienzo del archivo
	- Append
		Abre **archivo de texto** con el nombre asignado a la variable para escribir. Posiciona al programa al final del archivo.
- Posicionamiento (Seek)
		Posiciona al programa en el número especificado (no permitido en archivos de texto).
- Lectura
		Copia bytes desde el archivo de la variable que se proporciona, en la posición donde está el programa dentro del archivo, y luego posiciona al programa el pa. 
- Escritura
- Cierre
- Consultas
- Truncamiento

# Acceso a la Información
- Secuencial
- Secuencial indizado
- Directo