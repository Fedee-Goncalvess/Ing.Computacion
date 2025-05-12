
Program Ej5;

Type 

  casillero = Record
    num: 0..10;
    valor: boolean;
  End;
  tablero = array [15,15] Of casillero;

  elemento = Record
    fila: 1..15;
    columna: 1..15;
    num: 0..10;
  End;

  lista = ^nodo;
  nodo = Record
    dato: elemento;
    sig: lista;
  End;

Procedure InicializarTablero (Var T:tablero;L:lista;);

Var 
  i,j: integer;
Begin
  For i:= 1 To 15 Do
    Begin
      For j :=1 To 15 Do
        Begin
          T[i,j].num := 0;
          T[i,j].valor := false;
        End;
    End;
  While (L<>Nil) Do
    Begin
      T[L^.dato.fila,L^.dato.columna].num := L^.dato.num;
      T[L^.dato.fila,L^.dato.columna].valor := false;
    End;

End;

Procedure LeerJugador (Var J:elemento);
Begin
  read (J.fila);
  read (J.columna);
End;

Procedure EjecutarJuego (Var T:tablero);

Var 
  i: integer;
  J1,J2: elemento;
  max: string[25];
Begin
  J1.num := 0;
  J2.num := 0;
  For i:=1 To 10 Do
    Begin
      LeerJugador (J1);
      LeerJugador (J2);

      If (T[J1.fila,J1.columna].valor) Then
        Begin
          If (Not T[J2.fila,J2.columna].valor)Then
            J2.num := J2.num+1
        End
      Else
        Begin
          If (T[J2.fila,J2.columna].valor)Then
            J1.num := J1.num+1
          Else
            Begin
              If (T[J1.fila,J1.columna].num<>T[J2.fila,J2.columna].num)Then
                Begin
                  If (T[J1.fila,J1.columna].num>T[J2.fila,J2.columna].num) Then
                    J1.num := J1.num+1
                  Else
                    J2.num := J2.num+1;
                End;
            End;
        End;
    End;
  If (J1.num>J2.num) Then
    max := 'El ganador fue J1'
  Else
    Begin
      If (J1.num>J2.num) Then
        max := 'El ganador fue J2'
      Else
        max := 'Fue un empate';
    End;
  Write ('J1: ',J1.num,' J2: '.J2.num,' ',max);
End;

Var 
  T: tablero;
  L: lista;
Begin
  InicializarTablero(T,L);
  EjecutarJuego(T)
End.
