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

## Bloque Principal
### Explicación
Primero se asocia el archivo físico con una variable.
Luego se define la forma de apertura del archivo
Una vez hecho esto, se lee el primer registro del archivo
### Código
```pascal
Begin
	Assign(archivo, ‘hogares.dat’);
	Reset(archivo);
	WriteLn(‘Plan HELP 2020’); WriteLn;
	Leer(archivo, reg);
```

## Primer While
### Explicación
### Código
```pascal

	While (reg .codProv <> valorAlto) do begin
		codProvAct:=reg.codProv;
		votosProvincia:=0;
		writeLn('Provincia ', codProvAct);
		{Segundo While}
		{-------------}
		{Segundo While}
		writeLn(‘Hogares Plan Help Pcia: ', hogProvincia )
	end;
	Close(archivo); 
	WriteLn; 
	Write('Oprima tecla de ingreso para finalizar...'); 
	ReadLn 
end.
```

## Segundo While
### Explicación
### Código
```pascal
while (reg.codProv=codProvAct) do begin 
{corta la ejecución cuando cambia pcia}
	codLocAct:= reg.codLoc;
	hogLocalidad:=0;
	write(' Localidad ', codLocAct);
	{Tercer While}
	{------------}
	{Tercer While}
	hogProvincia := hogProvincia + hogLocalidad ;
	writeLn'('Hogares Plan Help localidad: ', hogLocalidad );
end;
```

## Tercer While
### Explicación
### Código
```pascal
while (reg.codProv=codProvAct) and (reg. codLoc=codLocAct) do begin {corta la ejecución cuando cambia pcia o la localidad}
	hogLocalidad := hogLocalidad + reg.cantidad;
	Leer(archivo, reg)
end;
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
