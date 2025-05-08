
Program Ej_9b;

Type 
  pixel = Record
    r: integer;
    g: integer;
    b: integer;
  End;
  ImagenRGB = Record
    ancho: integer;
    alto: integer;
    datos: array [1..1024,1..1024] Of pixel;
  End;

Procedure CopiarImagen (v:ImagenRGB;x:ImagenRGB)

Var 
  i,j: integer;
Begin
  For i:=1 To v.alto Do
    Begin
      For j:=1 To v.ancho Do
        Begin
          x.datos[i,j] := v.datos[i,j];
        End;
    End;
  x.ancho := v.ancho;
  x.alto := v.alto;
End;


Procedure Rotar (Var v:imagenRGB)

Var 
  aux: ImagenRGB;
  i,j: Integer;
Begin
  cont := v.alto;
  For i:=1 To v.alto Do
    Begin
      For j:= 1 To v.ancho Do
        Begin
          aux.datos[j,cont] := v.datos[i,j];
        End;
      cont := cont-1;
    End;
  aux.ancho := v.alto;
  aux.alto := v.ancho;
  v := aux;
End;

Procedure Espejar (Var v:ImagenRGB)

Var 
  i,j: integer;
Begin
  For i:=1 To v.alto Do
    cont := 0;
  Begin
    For j:= v.ancho Downto 1 Do
      Begin
        cont := cont+1;
        aux[i,cont] := v[i,j];
      End;
  End;
  v := aux
End;
