# Generación de Archivos-[[Merge]]

Este algoritmo permite generar un archivo resumiendo información obtenida de múltiples archivos.

- **No existe archivo maestro**
- **Se tienen 1 o n detalles**

## A tener en cuenta


### [[Actualización de Archivo Maestro-Detalle]]

**Algoritmo que permite actualizar la información de un archivo maestro a partir de múltiples detalles.**

Se puede disponer de 1 o n detalles.

#### Archivo Maestro
Resume información sobre un dominio determinado.

**Ejemplo Maestro:** 
	Archivo con información del personal de la facultad de ingeniería
#### Archivo Detalle
Cada archivo detalle contiene información que genera modificaciones sobre la información almacenada en el archivo maestro

**Ejemplo Detalle:**
	Archivo con las licencias solicitadas por dicho personal.

### [[Algoritmo de Corte de Control]]
Este algoritmo permite presentar la información de un archivo en forma organizada de acuerdo a la estructura del archivo origen.

**Ejemplo**: 
	Se deben contabilizar los hogares de bajos recursos en el territorio nacional. Cada registro contiene información de provincia, localidad, barrio y cantidad de hogares. La totalización debe realizarse por localidad y provincia.


