PROGRAM ProgramName;
PROCEDURE ProcedureName(var arr: array of integer);

VAR
  i: integer;
BEGIN (* ProcedureName *)
  SetLength(arr, 10);
  FOR i := 0 TO 9 DO BEGIN
    arr[i] := i;
  END; (* FOR *)

  FOR i := 0 TO 9 DO BEGIN
    WriteLn(arr[i]);
  END; (* FOR *)
END; (* ProcedureName *)
VAR
  arr: array of integer;
BEGIN (* ProgramName *)
  ProcedureName(arr);
END. (* ProgramName *)