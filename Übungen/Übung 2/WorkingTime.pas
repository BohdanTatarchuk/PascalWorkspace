(* Worktime                                     Bohdan Tatarchuk, 13-10-2023
   --------
   Diese Programm kann die Summe der Überstunden und Minusstunden der Folge
   von wöchentlichen Arbeitszeiten ermitteln und ausgeben
   -------------------------------------------------------------------------
*)

PROGRAM WorkTime;
    VAR
        over, lower, time, input: INTEGER;
BEGIN
    over := 0; //Überstunden
    lower := 0; //Minusstunden
    time := 0; //Zeitunterschied
    REPEAT
        Read(input); //Wöchentliche Arbeitszeit
        
        IF (input < 0) THEN BEGIN
            WriteLn('Falshe Werte');
        END ELSE IF (input = 0) THEN BEGIN
            WriteLn('Ende');
        END ELSE BEGIN
            time := input - 40;
            IF (time >= 0) THEN BEGIN
                over := over + time;
            END ELSE IF (time < 0) THEN BEGIN
                lower := lower + time * -1;
            END
        END //IF
    UNTIL input = 0;
    Write('Ueberstunden: ');
    WriteLn(over);
    Write('Minusstunden: ');
    WriteLn(lower);
END.
