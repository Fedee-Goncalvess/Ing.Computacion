
Program Ej12;

Type 
  Lista = ^nodo;
  nodo = Record
    dato: integer;
    sig: Lista;
  End;
  prueba = ^integer;

Procedure  modulo1 (A:lista;B:lista;Var C:lista);
Begin
  While (A^.sig<>Nil) Do
    A := A^.sig;
  A^.sig := B;
  C := A;
  A^.sig := Nil;
End;

Procedure modulo2(Var A:lista;B:lista);

Var 
  aux,ant: Lista;
Begin
  ant := A;
  aux := A;
  While (B<>Nil) Do
    Begin
      While (B^.dato>aux^.dato) Do
        Begin
          ant := aux;
          aux := aux^.sig;
        End;
      If (B^.dato<A^.dato) Then B^.sig := A;
      Else
        Begin
          B^.sig := aux;
          ant := B;
        End;
      B := B^.sig;
    End;
End;

Var 
Begin

End.
