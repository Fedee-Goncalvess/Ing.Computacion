
Program Ej_7;

Type 
  abc = array['a'..'z'] Of boolean;

Function pertenencia (c:abc;car:char): boolean;

Var 
  i: char;
Begin
  For i:= 'a'To 'z' Do
    Begin
      If (i=car) And (C[i]=true)Then
        pertenencia := true
      Else
        pertenencia := false;
    End;

End;
Procedure Union (C,V,R:abc);

Var 
  i: char;
Begin
  For i:='a' To 'z' Do
    Begin
      If (pertenencia(C,i)) Or (pertenencia(V,i)) Then
        R[i] := True;
    End;
End;

Procedure Diferencia (C,V,R:abc);

Var 
  i: char;
Begin
  For i:='a' To 'z' Do
    Begin
      If ( pertenencia(C,i)) And (Not pertenencia(V,i)) Then
        R[i] := True;
    End;
End;
