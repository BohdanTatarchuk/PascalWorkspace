(* Größter gemeinsamer Teiler                                      Bohdan Tatarchuk, 21-10-2023
   ---------------------------                      
   Euklidischen Algorithmus in Form einer Funktion 
   Gcd, die den größten gemeinsamen Teiler zweier positiver ganzer Zahlen als Funktionsergebnis 
   liefert
   --------------------------------------------------------------------------------------------
*)
PROGRAM GCD2;

   FUNCTION teiler(a, b: INTEGER): INTEGER;

   //Lokale Variablen
   VAR
      r: INTEGER;

   BEGIN //Teiler
      r := a mod b;

      WHILE (r <> 0) DO BEGIN
         a := b;
         b := r;
         r := a mod b;
      END; //WHILE

      Teiler := b;
   END; //Teiler

   
   //Globale Variablen
   VAR
      ersteZahl, zweiteZahl, Ergebnis: INTEGER;

BEGIN //GCD2
   WriteLn('Write a: ');
   ReadLn(ersteZahl);
   WriteLn('Write b: ');
   ReadLn(zweiteZahl);

   IF ((ersteZahl > 0) and (zweiteZahl > 0)) THEN BEGIN
      Ergebnis := teiler(ersteZahl, zweiteZahl);
      WriteLn('Ergebnis: ', Ergebnis);
   END ELSE BEGIN
      WriteLn('Fehler: Zahl ist nicht positiv');
   END; //Überprüfung des Wetrebereichs

END. //GCD2