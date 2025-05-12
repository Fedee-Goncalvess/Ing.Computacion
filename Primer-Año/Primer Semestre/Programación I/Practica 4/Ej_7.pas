
Program Ej_7;

Type 
  Plato = Record
    nombre: string[15];
    caliente: char;
    ingrediente: string[15];
  End;

  Representante = Record
    nombre: string[15];
    apellido : string[15];
    pais: string[15];
    comida: plato;
    sexo: char;
    edad: 1..100;
  End;
Procedure leerPlato (Var comida:Plato);
Begin
  writeln ('Introducir  nombre del plato');
  readln (comida.nombre);
  writeln ('c si es caliente, false si es f');
  readln (comida.caliente);
  writeln ('Introducir  ingrediente del plato');
  readln (comida.ingrediente);
End;

Procedure leerRepresentante (Var rep:Representante);
Begin
  writeln ('Introducir nombre');
  readln (rep.nombre);
  writeln ('Introducir apellido');
  readln (rep.apellido);
  writeln ('Introducir pais');
  readln (rep.pais);
  leerPlato (rep.comida);
  writeln ('Introducir sexo');
  readln (rep.sexo);
  writeln ('Introducir edad');
  readln (rep.edad);
End;

Var 
  rep: Representante;
  i,g,frios,prom: integer;
  actPais: string;
Begin
  frios := 0;
  prom := 0;
  For i:= 1 To 20 Do
    Begin
      For g:= 1 To 7 Do
        Begin
          leerRepresentante (rep);
          actPais := rep.pais;
          If (rep.sexo= 'f') And (rep.comida.caliente= 'f') And (rep.pais=
             actPais) Then
            Begin
              frios := frios+1;
              prom := prom+rep.edad;
            End
          Else
            Begin
              If (rep.comida.caliente = 'c') And (rep.comida.ingrediente =
                 'pollo') And (rep.pais= actPais) Then
                Begin
                  write (rep.nombre,rep.apellido,rep.pais);
                  prom := prom+rep.edad;
                End
              Else
                prom := prom + rep.edad;
            End;
        End;
    End;
  prom := prom Div 140;
  write ('edad promedio: ',prom);
End.
