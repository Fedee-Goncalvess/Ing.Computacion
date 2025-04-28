Este procedure se debe utilizar siempre para algoritmos ,[[Merge]] 
--
## Procedure
### Explicación
Busca el producto con menor código entre los registros actuales del array
Actualiza min para que sea ese el producto de menor código.
Avanza en el archivo de donde salió ese producto (lee el próximo)

*Cuando hacés un **merge** de archivos ordenados por código, siempre agarrás el menor para mantener el orden*
### Código
```pascal
procedure minimo(var det: adet; var rdet: ardet; var min: producto);
var
  posMin: int;
begin
  posMin := 1;
  min := rdet[1];
  for i := 2 to 3 do
  begin
    if (rdet[i].codigo < min.codigo) then
    begin
      min := rdet[i];
      posMin := i;
    end;
  end;
  leer(det[posMin], rdet[posMin]);
end;

```
