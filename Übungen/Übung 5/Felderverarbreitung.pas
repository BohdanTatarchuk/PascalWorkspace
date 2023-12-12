(* Felderverarbeitung                                                 Bohdan Tatarchuk, 26-11-2023
   ------------------                     
   Eine Pascal-Prozedur, die das Feld a3 so belegt, dass darin alle n3 Zahlen in aufsteigend 
   sortierter Reihenfolge enthalten sind, die in a1 und in a2 vorkommen.
   -----------------------------------------------------------------------------------------------
*)

PROGRAM Feld;

CONST
  n1 = 5;
  n2 = 2;
  value = 16; //array values range

procedure declarate(var a: array of integer);

var
 i: integer;

begin
  for i := low(a) to high(a) do 
    a[i] := Random(value);
end;

PROCEDURE Merge(a1: ARRAY OF INTEGER; n1: INTEGER;
  a2: ARRAY OF INTEGER; n2: INTEGER;
  VAR a3: ARRAY OF INTEGER; VAR n3: INTEGER);

var
  i, j, k: integer;

begin
  j := 0;

  //creating a single array
  for i := 0 to n1 - 1 do begin 
    a3[i] := a1[i];
  end;
  for i := 0 to n2 - 1 do begin 
    a3[i + n1] := a2[i];
  end; 

  //sorting
  for i := 0 to n3 - 1 do begin
    for k := 0 to n3 - 1 do begin
      if ((k + 1) < n3) then begin 
        if (a3[k] > a3[k + 1]) then begin
          j := a3[k];
          a3[k] := a3[k + 1];
          a3[k + 1] := j;
        end;
      end else if ((k + 1) > n3) then begin
        WriteLn('Error: Overflow');
        Halt;
      end;
    end;//inner for
  end; //outer for

end; //merge

procedure output(var arr: array of integer);
  var
    i: integer;

begin
  for i := 0 to high(arr) do
    Write(arr[i], ' ');
end;

//global variables
var
  n3: integer;
  arr1: array [1..n1] of integer;
  arr2: array [1..n2] of integer;
  arr3: array [1..7]of integer;

BEGIN (* Feld *)
  Randomize;
  declarate(arr1);
  declarate(arr2);

  Writeln('First array: ');  output(arr1); WriteLn;
  Writeln('Second array: '); output(arr2); WriteLn;

  n3 := high(arr3);

  Merge(arr1, n1, arr2, n2, arr3, n3);
  Writeln('Third (merged) array: '); output(arr3); WriteLn;

END. (* Feld *)