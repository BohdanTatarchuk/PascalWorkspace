PROGRAM test;

Type
IntArray = ARRAY [1..10] OF integer;

VAR
arr: IntArray;

PROCEDURE Fill(VAR arr: IntArray);
VAR
  i: integer;
BEGIN (* Fill *)

  FOR i :=  low(arr) TO high(arr) DO BEGIN
    arr[i] := i;
  END; (* FOR *)

END; (* Fill *)


VAR
  i: integer;
BEGIN (* test *)
  Fill(arr);

  FOR i :=  low(arr) TO high(arr) DO BEGIN
    WriteLn(arr[i]);
  END; (* FOR *)
 
END. (* test *)