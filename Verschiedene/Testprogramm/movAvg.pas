PROGRAM MovAvg1;

VAR
  sum: real;
  num: integer;

FUNCTION MovAvg(w: real): real;

BEGIN (* MovAvg *)
  sum := sum + w;
  Inc(w);
  MovAvg := sum / num;
    
END; (* MovAvg *)

BEGIN (* MovAvg1 *)
  sum := 0; num := 0;
  WriteLn(MovAvg(2):5:2);
  WriteLn(MovAvg(3):5:2);

END. (* MovAvg1 *)