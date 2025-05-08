
Program Ej_tres;

Var 
  i,num,cifra,suma: Integer;
Begin
  For i:= 1 To 10 Do
    Begin
      writeln ('Insertar numero entero');
      read (num);
      suma := 0;
      Repeat
        While (num<>0) Do
          Begin
            cifra := num Mod 10;
            num := num Div 10;
            suma := suma + cifra;
          End;
        num := suma;
      Until (num<=10);
      write ('La suma de las cifras del numero da como resultado= ',num);
      Case (num) Of 
        1: writeln (' (uno)');
        2: writeln (' (dos)');
        3: writeln (' (tres)');
        4: writeln (' (cuatro)');
        5: writeln (' (cinco)');
        6: writeln (' (seis)');
        7: writeln (' (siete)');
        8: writeln (' (ocho)');
        9: writeln (' (nueve)');
      End;
    End;
End.
