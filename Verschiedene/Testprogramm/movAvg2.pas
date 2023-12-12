PROGRAM MovAvg2;

Type 
  movAvgState = RECORD
                  sum : real;
                  num : integer;
                end;

PROCEDURE InitState(var state : movAvgState);

BEGIN (* InitState *)
  state.sum := 0;
  state.num := 0;
END; (* InitState *)

PROCEDURE MovAvg(w: real; var ma: real; var state : movAvgState);

BEGIN (* MovAvg *)
  state.sum := state.sum + w;
  Inc(state.num);
  ma := state.sum / state.num;
    
END; (* MovAvg *)

VAR
  maState: movAvgState;
  ma : real;

BEGIN (* MovAvg1 *)
  InitState(maState); 
  MovAvg(2, ma, maState); WriteLn(ma:5:2); 
  MovAvg(3, ma, maState); WriteLn(ma:5:2); 
  MovAvg(1, ma, maState); WriteLn(ma:5:2); 
  

END. (* MovAvg1 *)