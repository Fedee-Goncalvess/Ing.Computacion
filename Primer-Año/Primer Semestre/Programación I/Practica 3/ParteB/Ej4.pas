
Program Ej4;

Type 
  {inicializo el tipo de caracter antes, para que todo el algoritmo lo use}
  abc = set Of char;

Procedure Imprimir (faltantes:abc);     {faltantes es de tipo abc}

Var 
  i: char;
Begin
  For i:= ('a') To ('z') Do
    If (i In faltantes) Then
      write (i);
End;

Procedure contabilizar (car:char);

Var 
  letras: abc;
  faltantes: abc;
Begin
  letras := ['a'..'z'];
  faltantes := letras;
  While (car <> '#') Do
    Begin
      If (car In letras) Then
        faltantes := faltantes - [car];
      {Si la letra esta en abc se las saco a la otra variable}
      read (car);
    End;
  imprimir (faltantes);
  {llamo al otro modulo, evaluado en faltantes}
End;

Var 
  car: char;
{car es de tipo char, ya que el texto a ingresar puede ser de cualquier caracter}
Begin
  writeln ('Ingrese un texto');
  read (car);
  contabilizar(car);
End.
