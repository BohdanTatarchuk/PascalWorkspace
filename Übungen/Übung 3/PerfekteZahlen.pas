(* Perfekte Zahlen                                      Bohdan Tatarchuk, 21-10-2023
   ---------------------------                      
   Diese Programm überpfürft, ob die Zahl perfekt ist.
   ---------------------------------------------------------------------------------
*)

PROGRAM PerfekteZahlen;

FUNCTION check(a: INTEGER): BOOLEAN;
  //Lokale Variablen
  VAR
    sum, i: INTEGER;
    result: BOOLEAN;

BEGIN //check
  sum := 1;
  i := 2;

  REPEAT
    IF (a mod i) = 0 THEN BEGIN
      sum := sum + i + (a div i);
      i := i + 1;
    END ELSE BEGIN
      i := i + 1;
    END; //IF
  UNTIL (sum >= a); //REPEAT

  IF (sum = a) THEN BEGIN
    result := true;
    check := result;
  END ELSE BEGIN
    result := false;
    check := result;
  END; (* IF *)

END; //check

//Globale Variablen
VAR
  n : INTEGER;

BEGIN //PerfekteZahlen 
  WriteLn('Gib deine Zahl ein: ');
  ReadLn(n);

  IF (n > 0) THEN BEGIN
    IF (check(n)) THEN BEGIN
      WriteLn('Die Zahl ist perfekt');
    END ELSE BEGIN
      WriteLn('Die Zahl ist nicht perfekt');
    END; //Ausgabe
  END ELSE BEGIN
    WriteLn('Fehler: die Zahl nicht positiv ist');
  END; 
  //Überprüng, ob die Zahl positiv ist. Wenn die Zahl negativ oder 0 ist,
  //kann die Summe von den positiven Teiler nicht gleich eingegebene Zahl sein.

END. //PerfekteZahlen 