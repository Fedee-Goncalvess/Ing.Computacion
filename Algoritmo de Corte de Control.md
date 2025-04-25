# Desarrollo del código

## Type
### Explicación
Primero se tiene una constante que marca el fin de un archivo, y luego la estructura de cada registro.
### Código
```pascal
Type
	{Marca de Fin de archivo}
	const valorAlto = 1000000;
	{Estructura de cada registro}
	RegistroHogares = Record
		Codigo_prov: integer;
		Codigo_localidad: integer;
		Barrio: integer;
		Cantidad: integer;
	end;
	tArchivo = File of RegistroHogares
```

## Var
```pascal
Var
	archivo: tArchivo;
	hogProvincia, hogLocalidad, cod_provincia,cod_localidad:integer;
	reg: RegistroHogares;

```

## Procedure
### Explicación
Procedimiento para leer del archivo con corte de control


### Código
```pascal
procedure leer(var archivo: tArchivo; var dato: RegistroHogares);
begin
	if (not(EOF(archivo))) then
		read (archivo, dato)
	else
		dato.Codigo_prov := valoralto;
end;
```

```pascal

```

# Algoritmo Completo
```pascal
Program hogaresPlanHelp

Type
	const valorAlto = 1000000;
	RegistroHogares = Record
		Codigo_prov: integer;
		Codigo_localidad: integer;
		Barrio: integer;
		Cantidad: integer;
	end;
	tArchivo = File of RegistroHogares
Var
	archivo: tArchivo;
	hogProvincia, hogLocalidad, cod_provincia,cod_localidad:integer;
	reg: RegistroHogares;

procedure leer(var archivo: tArchivo; var dato: RegistroHogares);
begin
	if (not(EOF(archivo))) then
		read (archivo, dato)
	else
		dato.Codigo_prov := valoralto;
end;

Begin
	Assign(archivo, ‘hogares.dat’);
	Reset(archivo);
	WriteLn(‘Plan HELP 2020’); WriteLn;
	Leer(archivo, reg);
	While (reg .codProv <> valorAlto) do begin
		codProvAct:=reg.codProv;
		votosProvincia:=0;
		writeLn('Provincia ', codProvAct);
		while (reg.codProv=codProvAct) do begin 
		{corta la ejecución cuando cambia pcia}
			codLocAct:= reg.codLoc;
			hogLocalidad:=0;
			write(' Localidad ', codLocAct);
			while (reg.codProv=codProvAct) and (reg. codLoc=codLocAct) do begin {corta la ejecución cuando cambia pcia o la localidad}
				hogLocalidad := hogLocalidad + reg.cantidad;
				Leer(archivo, reg)
			end;
			hogProvincia := hogProvincia + hogLocalidad ;
			writeLn'('Hogares Plan Help localidad: ', hogLocalidad );
		end;
		writeLn(‘Hogares Plan Help Pcia: ', hogProvincia )
	end;
	Close(archivo); 
	WriteLn; 
	Write('Oprima tecla de ingreso para finalizar...'); 
	ReadLn 
end.
```
