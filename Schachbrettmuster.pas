(* Schachbrettmuster                                    Bohdan Tatarchuk, 13-10-2023
   --------
   Ein Programm, das einen ganzzahligen Wert n einliest und für eine gültige 
   Eingabe (Wertebereich 1 ≤ n ≤ 20) ein zweidimensionales n-mal-n Schachbrett-Muster mit 
   abwechselnden Leerzeichen und Sternchen * ausgibt.
   ---------------------------------------------------------------------------------------
*)
PROGRAM Schachbrett;
   VAR
      i, j, input: INTEGER;
      line: string;
BEGIN 
      Read(input);
      line := '';

      //von 1 bis 20 Überprüfung
      IF (input <= 20) THEN BEGIN
        IF (input >= 1) THEN BEGIN
          //Schleife für die Zeilen
          FOR i := 1 TO input DO BEGIN
            //Schleife für die Spalten
            FOR j := 1 TO input DO BEGIN
              IF ((i + j) mod 2 = 0) THEN BEGIN
                line := line + '*';
              END ELSE BEGIN
                line := line + ' ';
              END; //IF GERADE ODER UNGERADE
            END; //FOR 2
            line := line + #13#10;
          END; //FOR 1
          Write(line);
        END ELSE BEGIN 
          WriteLn('Number is smaller then 1');
        END;//IF GREATER THEN 1
      END ELSE BEGIN 
        WriteLn('Number is greater then 20');
      END;//IF SMALLER THEN 20
END. //Schachbrett