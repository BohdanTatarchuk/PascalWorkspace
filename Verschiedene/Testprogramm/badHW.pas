PROGRAM Strom;

CONST
 weekdays = 7;
 n = 11;

TYPE
 WeekdayValues = ARRAY [1..weekdays] OF REAL;

//declarates an array measuredValues
procedure declarate(var measuredValues: array of real);

var 
  i: integer;

begin
  for i := low(measuredValues) to high(measuredValues) do begin 
    measuredValues[i] := i + 0.5;
  end;
end;

//calculates an avarage power consumption per week
PROCEDURE AveragePerWeekday(measuredValues: ARRAY OF REAL; n: INTEGER; VAR avg: WeekdayValues);

var
  i, j, numOfWeeks, dayOfWeek: integer;

begin
  numOfWeeks := (n div 7) + 1;

  // for i := 1 to numOfWeeks do begin
  //   for j := low(avg) to high(avg) do begin
  //     avg[j] := measuredValues[j];
  //     if (j + (i * weekdays) < n) then begin
  //       avg[j] := (avg[j] + measuredValues[j + (i * weekdays)]) / i;
  //     end;
  //   end;
  // end;

  for j := 1 to numOfWeeks do begin
    for i := 0 to n - 1 do begin
      dayOfWeek := (i mod weekdays) + 1;
      if (weekdays * (j - 1) + dayOfWeek <= n - 1) then
      avg[dayOfWeek] := avg[dayOfWeek] + measuredValues [weekdays * (j - 1) + dayOfWeek];
    end;
  end;
end; 

//outputs an array
procedure output(avg: array of real);

var 
  i: integer;

begin
  for i := low(avg) to high(avg) do begin
    Write(i, ': ',avg[i]:5:2, ' ');
  end;
end;

//global variables
var
  measuredValues: array [1..n] of real;
  avg: WeekdayValues;

BEGIN (* Strom *)
  //declarate(measuredValues);
  measuredValues[1] := 8.0;
  measuredValues[2] := 8.0;
  measuredValues[3] := 21.0;
  measuredValues[4] := 12.0;
  measuredValues[5] := 8.5;
  measuredValues[6] := 9.0;
  measuredValues[7] := 11.0;
  measuredValues[8] := 8.0;
  measuredValues[9] := 9.0;
  measuredValues[10] := 9.0;
  measuredValues[11] := 8.0;
  AveragePerWeekday(measuredValues, n , avg);
  output(measuredValues); Writeln;
  output(avg);
END. (* Strom *)