
Program Ej_10;

Const 
  C = 2000;

Type 
  Nombres = array[1..C] Of string;

Function PosNombre (Var V:Nombres;p:String;dimL:integer): integer;

Var 
  i: integer;
Begin
  i := 1;
  While (p > V[i]) And (dimL>=i) Do
    Begin
      i := i+1;
    End;
  If (V[i]>p) Or (i>dimL) Then
    i := 0;
  PosNombre := i;
End;

Procedure InNom (Var V:Nombres;p:String);

Begin
  If (dimL>dimF) Then
    For i:= dimL Downto pos Do
      V[i+1] := V[i];
  V[pos] := p;
End;
{hacer bien puto hacelo bien la conchade tu madre}

Var 
  n: nombres;
  dimL: integer;
  persona: string;

Begin
  CargaDatos(n,dimL);
  PosNombre(n,persona,dimL);
  InNombre(n,diml);
  XNombre();
End;
