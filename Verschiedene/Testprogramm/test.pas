PROGRAM ConcatPrg;

VAR
  i: integer;
  temp: char;
  arr, result: string;

BEGIN (* ConcatPrg *)
  Readln(arr);

  WriteLn('Before: ', arr);

  for i := low(arr) + 1 to high(arr) - 1 do begin
    arr[i] := arr[i + 1];
  end;

  WriteLn('After: ', arr);
END. (* ConcatPrg *)