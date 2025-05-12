
Program Ej_8;

Const 
  num = 150;

Type 
  letras = array [1..num] Of char;

Procedure descartarBlancos (C:letras;Var i:integer);
Begin
  While (C[i]=' ') And (i <=num) Do
    i := i+1;
End;

Function CantPalabras (C:letras): integer;

Var 
  cantp,i: integer;

Begin
  cantp := 0;
  i := 1;
  descartarBlancos(C,i);
  While (i<=num) Do
    Begin
      While (i<=num) And (C[i]<> ' ') Do
        i := i+1;
      descartarBlancos (C,i);
      cantp := cantp+1
    End;
  CantPalabras := cantp;
End;

Function A_CantPalabras (C:letras;dimL:integer): integer;

Var 
  cantp,i: integer;

Begin
  cantp := 0;
  i := 1;
  descartarBlancos(C,i);
  While (i<=num) Do
    While (i<=num) And (i<=dimL) Do
      Begin
        While (i<=num)And (i<=dimL) And (C[i]<> ' ') Do
          i := i+1;
        descartarBlancos (C,i);
        cantp := cantp+1
      End;
  CantPalabras := cantp;
End;

Function B_CantPalabras (C:letras): integer;

Var 
  cantp,i: integer;

Begin
  cantp := 0;
  i := 1;
  descartarBlancos(C,i);
  While (i<=num) Do
    Begin
      While (i<=num) And (C[i]<> '.') Do
        While (i<=num) And (C[i]<> '.') And (C[i]<>' ') Do
          Begin
            i := i+1;
            descartarBlancos (C,i);
            cantp := cantp+1
          End;
    End;
  CantPalabras := cantp;
End;
