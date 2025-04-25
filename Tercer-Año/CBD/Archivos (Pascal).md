
---
# Tipos de Archivos
- Longitud Fija 
- Unidades Indeterminadas 
- Texto 

---
# Operaciones
- **Asignación** (Assign)
		Asocia la ubicación física real del archivo para poder utilizar dicha variable
- **Apertura**
	- Rewrite
		Crea un archivo con el nombre asignado a la variable para escribir. Si ya existe borra su contenido posicionando al programa al comienzo del archivo.
	- Reset
		Abre un archivo con el nombre asignado a la variable tanto para leer como para escribir. Posiciona el programa al comienzo del archivo
	- Append
		Abre **archivo de texto** con el nombre asignado a la variable para escribir. Posiciona al programa al final del archivo.
- **Posicionamiento** (Seek)
		Posiciona al programa en el número especificado (no permitido en archivos de texto).
- **Lectura**
		Copia bytes desde el archivo a la variable que se proporciona, en la posición donde está el programa dentro del archivo, y luego posiciona al programa en la posición siguiente. 
		Archivo -> Variable
		**Read**: Archivos de registro y texto
		**ReadLn**: Archivos de texto
- **Escritura**
		Copia bytes desde la variable que se proporciona, al archivo, en la posición donde está el programa en el archivo, y posiciona al programa en la siguiente posición.
		Variable -> Archivo
		**Write**: Archivos de registros y de texto
		**WriteLn**: Archivos de texto
- **Cierre** (Close)
		Desactiva dirección de transferencia entre programa y archivo, y posicionamiento del programa en el archivo.
- **Consultas**
		FileSize: Tamaño en unidades del archivo
		FilePos: Número relativo en la que está posicionado el programa en el archivo
		EoF: Si el programa está posicionado a continuación de la última unidad del archivo
		EoL: Si el programa está posicionado a continuación de la última línea del archivo *(Sólo en archivos de texto)*
- Truncamiento

---
# Acceso a la Información
- Secuencial
- Secuencial indizado
- Directo
---
