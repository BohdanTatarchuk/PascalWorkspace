UNIT MovAvgModule;

INTERFACE
  PROCEDURE InitState;
  FUNCTION MovAvg(w:real): real;

  
IMPLEMENTATION
  var 
    num : integer;
    sum : real;

  PROCEDURE InitState;
  BEGIN
    sum:=0; num:=0;
  end;

  FUNCTION MovAvg(w:real): real;
  begin
    sum := sum + w;
    Inc(num);
    MovAvg := sum / num;
  end;

BEGIN (* MovAvgModule *)
  InitState;
END. (* MovAvgModule *)