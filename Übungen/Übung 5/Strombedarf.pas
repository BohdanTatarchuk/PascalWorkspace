(* Felderverarbeitung                                                 Bohdan Tatarchuk, 28-11-2023
   ------------------
   Gegeben ist ein beliebig großes Feld measuredValues, das n Messwerte des täglichen Strombedarfs 
   (z.B. in der Einheit kWh) eines Haushalts enthält.          
   Eine Pascal-Prozedur, die den durchschnittlichen Strombedarf für jeden Wochentag ermittelt und
   in das Feld avg speichert. 
   -----------------------------------------------------------------------------------------------
*)

Program Strombedarf;
const
  weekdays = 7;
  
type
  WeekdayValues = array [1..weekdays] of real;

procedure AveragePerWeekday(measuredValues: array of real; n: integer; var avg: WeekdayValues);
var
  count: WeekdayValues;
  i, dayIndex: integer;
begin

  for i := 0 to n - 1 do begin
    dayIndex := (i mod weekdays) + 1; //from 1 to 7
    avg[dayIndex] := avg[dayIndex] + measuredValues[i]; //put values into avg array
    count[dayIndex] := count[dayIndex] + 1; //saving the amount of days
  end;

  for i := 1 to weekdays do begin //avarage counting
    if count[i] > 0 then
      avg[i] := avg[i] / count[i];
  end;

end;

var //global variables
  measuredValues: array of real;
  n: integer;
  avarage: WeekdayValues;
  i: integer;

begin
  n := 11; //example array init
  SetLength(measuredValues, n);
  measuredValues := [0.0, 8.0, 2.0, 11.0, 8.5, 10, 11.0, 8.0, 0.0, 9.0, 8.0];

  AveragePerWeekday(measuredValues, n, avarage); //function call
  for i := 0 to n - 1 do
    Write(measuredValues[i]:2:2, ' '); //output
  WriteLn;
  for i := 1 to weekdays do
    Write(avarage[i]:2:2, ' '); //output
end.
