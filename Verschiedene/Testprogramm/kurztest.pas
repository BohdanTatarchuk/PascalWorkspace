PROGRAM Feld;

Type 
  IntArray = array [0..3] of integer;

FUNCTION copyAllPositives (a1: IntArray): IntArray;

VAR
  a2: IntArray;
  i, n1: integer;

BEGIN (* copyAllPositives  *)

  n1 := high(a1);
  FOR i := low(a1) TO n1 DO BEGIN
    IF (a1[i] > 0) THEN BEGIN
      a2[i]:= a1[i];
    END ELSE BEGIN
      a2[i]:= 0;
    END; (* IF *)
  END; (* FOR *)

  copyAllPositives := a2;
END; (* copyAllPositives  *)

VAR
  arr1,arr2: IntArray;
  i: integer;

BEGIN (* Feld *)
  arr1[1] := 1;
  arr1[2] := -1;
  arr1[3] := 1;

  arr2 := copyAllPositives(arr1);
  for i := 1 to high(arr2) do begin
    WriteLn(arr2[i]);
  end;
END. (* Feld *)