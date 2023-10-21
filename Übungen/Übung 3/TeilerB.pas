(* Größter gemeinsamer Teiler                                      Bohdan Tatarchuk, 21-10-2023
   ---------------------------                      
   Euklidischen Algorithmus in Form einer Funktion 
   Gcd, die den größten gemeinsamen Teiler dreier positiver ganzer Zahlen als Funktionsergebnis 
   liefert
   --------------------------------------------------------------------------------------------
*)
PROGRAM GCD3;

  FUNCTION gdc2(a, b: INTEGER): INTEGER;
  //Lokale Variablen
  VAR
    r: INTEGER;

  BEGIN //gdc 2
    r := a mod b;

    WHILE (r <> 0) DO BEGIN
        a := b;
        b := r;
        r := a mod b;
    END; //WHILE

    gdc2 := b;
  END; //Teiler

  //Globale Variablen
  VAR
    ersteZahl, zweiteZahl, dritteZahl, Ergebnis: INTEGER;

BEGIN //GCD3
   WriteLn('Write a: ');
   ReadLn(ersteZahl);
   WriteLn('Write b: ');
   ReadLn(zweiteZahl);
   WriteLn('Write c: ');
   ReadLn(dritteZahl);

   IF ((ersteZahl > 0) and (zweiteZahl > 0) and (dritteZahl > 0)) THEN BEGIN
      Ergebnis := gdc2(gdc2(ersteZahl, zweiteZahl), gdc2(ersteZahl, dritteZahl));
      WriteLn('Ergebnis: ', Ergebnis);
   END ELSE BEGIN
      WriteLn('Fehler: Zahl ist nicht positiv');
   END; //Überprüfung des Wetrebereichs

END. //GCD3