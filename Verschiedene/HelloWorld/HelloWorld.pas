PROGRAM Mean;
  VAR
  total, numbers, value: INTEGER;
    BEGIN
      total := 0;
      numbers := 0;
      REPEAT
      Read(value);
      IF value > 0 THEN BEGIN
        total := total + value;
        numbers := numbers + 1
      END (*IF*)
    UNTIL value <= 0;
      IF numbers > 0 THEN
        WriteLn(total / numbers:2:0)
      ELSE
        WriteLn('no values')
END. (*Mean*)

