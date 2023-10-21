(* Date          Bohdan Tatarchuk, 19=10=2023
   ========
   A program that requires the user to input a correct date (as three numbers denoting day, month
   and year) and then computes how many days have passed since the beginning of the year.
   ============================================================
*)

PROGRAM Date;

  VAR
    day, month, year, i, result: INTEGER;
    n: array [1..12] of INTEGER;

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

  IF (day < 0) THEN BEGIN
    WriteLn('Error: date is negative');
  END ELSE IF (month < 0) THEN BEGIN
    WriteLn('Error: date is negative');
  END ELSE IF (year < 0) THEN BEGIN
    WriteLn('Error: date is negative');
  END ELSE BEGIN
    IF (1 <= month) THEN BEGIN
      IF (month <= 12) THEN BEGIN
        REPEAT
          i := i + 1;
          IF (day > n[i]) THEN BEGIN
            WriteLn('Error: date is out of months range'); // 12.06.2005 
          END ELSE BEGIN
            result := day + n[i-1];
          END; (* IF *)
        UNTIL (month = i); //REPEAT
      END ELSE BEGIN
        Write('Error: month is not between 1 and 12');
      END; //IF
    END ELSE BEGIN
      WriteLn('Error: month is not between 1 and 12');
    END; //Month check
  END; //Negative check
END. //Date