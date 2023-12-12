PROGRAM MovAvg3;

FUNCTION MovAvg(w: real): real;

const sum : real = 0;
      num : integer = 0;

BEGIN (* MovAvg *)
  sum := sum + w;
  Inc(num);
  MovAvg := sum / num;
END; (* MovAvg *)

BEGIN (* MovAvg1 *)
 WriteLn(movAvg(2):5:2);
 WriteLn(movAvg(3):5:2);
 WriteLn(movAvg(1):5:2);
END. (* MovAvg1 *)