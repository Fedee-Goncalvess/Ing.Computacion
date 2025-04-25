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
hogProvincia, hogLocalidad , cod_provincia,cod_localidad: integer;
reg: RegistroHogares;
Begin

```
