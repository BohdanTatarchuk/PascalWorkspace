(* Date          Bohdan Tatarchuk, 19-10-2023
   ====
   A program that requires the user to input a correct date (as three numbers denoting day, month
   and year) and then computes how many days have passed since the beginning of the year.
   ==============================================================================================
*)

PROGRAM Date;

//Global variables
VAR
  day, month, year, i, a, output: INTEGER;
  n: array [1..12] of INTEGER;
  result: BOOLEAN;

BEGIN //date
  WriteLn('Write the date: ');
  Read(day, month, year);

  n[1] := 31;
  n[2] := 28;
  n[3] := 31;
  n[4] := 30;
  n[5] := 31;
  n[6] := 30;
  n[7] := 31;
  n[8] := 31;
  n[9] := 30;
  n[10] := 31;
  n[11] := 30;
  n[12] := 31;

  output := 0;

  IF ((day <= 0) or (month <= 0) or (year <= 0)) THEN BEGIN
    WriteLn('Error: date is negative or 0');
  END ELSE BEGIN
    IF (month <= 12) THEN BEGIN
      REPEAT
        i := i + 1;

        IF ((day > n[i]) or (day <= 0)) THEN BEGIN
          result := false; 
        END ELSE BEGIN
          result := true;
        END; //Days check

      UNTIL (month = i); //REPEAT

      IF (result) THEN BEGIN
        
        FOR a := 1 TO month - 1 DO BEGIN
          output := output + n[a]; 
        END; //Sum of days since the beginning of the year
      
      Writeln(output + day);

      END ELSE BEGIN
        Writeln('Error: incorrect number of days');
      END; //Days check

    END ELSE BEGIN
      WriteLn('Error: month is greater than 12');
    END; //Month check
  END; //Negative check
END. //Date