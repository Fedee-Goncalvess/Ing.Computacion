>Este procedure se debe utilizar siempre para algoritmos ,[[Algoritmo de Corte de Control]], [[Merge]] y []
## Procedure
### Explicación
Procedimiento para leer el registro del archivo con corte de control
Si no es EOF -> Leer
Es EOF -> Corte de Control
### Código
```pascal
procedure leer(var archivo: tArchivo; var dato: RegistroHogares);
begin
	if (not(EOF(archivo))) then
		{Si no es fin de archivo, leer registro}
		read (archivo, dato)
		
	else
		{i es EOF, marcar como fin lógico con valorAlto}
		dato.Codigo_prov := valoralto;
end;
```
