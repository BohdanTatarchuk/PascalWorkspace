(* Logarithmus                                           Bohdan Tatarchuk, 21-10-2023
   ---------------------------                      
    Eine Funktion, die ganzzahlige Logarithmen zu einer beliebigen ganzzahligen Basis
    𝑏𝑎𝑠𝑒 ≥ 2 für ganzzahlige Werte 𝑥 ≥ 1 berechnet und (auch intern) nur den Datentyp
    INTEGER verwendet.
   ----------------------------------------------------------------------------------
*)

PROGRAM Logarithmus;

FUNCTION power(x, n: INTEGER): INTEGER;
  //Lokale Variablen
  VAR
    result, i: INTEGER;

BEGIN //Power
  result := x;

  FOR i := 2 TO n DO BEGIN
    result := result * x;
  END; //FOR

  power := result;
END; //Power 

FUNCTION intLog (x, base: INTEGER): INTEGER;
//Lokale Variablen
  VAR
    y: INTEGER;

BEGIN //IntLog
  y := 0;
  WHILE Power(base, y) <= x DO
    y := y + 1;
  intLog := y - 1;
END; //IntLog

//Globale Variablen
VAR
  numerus, basis, log: INTEGER;

BEGIN //Logarithmus
  WriteLn('Gib Logarithmus-Basis ein: ');
  ReadLn(basis);
  WriteLn('Gib Numerus ein: ');
  ReadLn(numerus);

  IF ((basis >= 2) and (numerus >= 1)) THEN BEGIN
    log := intLog(numerus, basis);
    //log := power(basis, numerus);
    WriteLn('Ergebnis: ', log);
  END ELSE BEGIN
    WriteLn('Fehler: Die Basis muss >= 2 sein und der Numerus muss >= 1 sein');
  END; //Überprüfung des Wertebereichs

END. //Logarithmus