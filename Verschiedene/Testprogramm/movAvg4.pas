PROGRAM MovAvg4;
USES MovAvgModule;

BEGIN (* MovAvg1 *)
 InitState;
 WriteLn(movAvg(2):5:2);
 WriteLn(movAvg(3):5:2);
 WriteLn(movAvg(1):5:2);
END. (* MovAvg1 *)