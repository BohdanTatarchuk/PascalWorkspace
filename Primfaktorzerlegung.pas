(* Primafaktorenzerlegung          Bohdan Tatarchuk, 13-10-2023
   --------
   Programm, das für eine positive ganze Zahl alle Primfaktoren 
   in auf steigender Reihenfolge ausgibt.
   ------------------------------------------------------------
*)

PROGRAM Primafaktorenzerlegung;
  VAR
    input, n: INTEGER;

BEGIN //Primafaktorenzerlegung
  Read(input);

  IF (input > 0) THEN BEGIN
    REPEAT
      IF ((input mod 2) = 0) THEN BEGIN
        n := 2;
        input := input div n;
        Write(n, ', ');
      END ELSE IF((input mod 3) = 0) THEN BEGIN
        n := 3;
        input := input div n;
        Write(n, ', ');
      END ELSE IF((input mod 5) = 0) THEN BEGIN
        n := 5;
        input := input div n;
        Write(n, ', ');
      END ELSE IF((input mod 7) = 0) THEN BEGIN
        n := 7;
        input := input div n;
        Write(n, ', ');
      END ELSE BEGIN
        n := input;
        input := input div n;
        Write(n, ', ');
      END; //IF
    UNTIL (input = 1); //Repeat
    
  END ELSE BEGIN
    WriteLn('Number is not postive');
  END; //Ob Input als 0 größer ist 
END. //Primafaktorenzerlegung