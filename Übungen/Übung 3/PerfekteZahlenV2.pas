(* Perfekte Zahlen                                      Bohdan Tatarchuk, 28-11-2023
   ---------------------------                      
   Diese Programm überpfürft, ob die Zahl perfekt ist.
   ---------------------------------------------------------------------------------
*)

Program PerfekteZahlen;

function check(a: integer): BOOLEAN;
var
  sum, i: integer;
  result: boolean;

begin
  sum := 1;
  i := 2;

  if (a <= 0) then begin
    WriteLn('Error: number is not positive');
    Halt;
  end;

  repeat
    if (a mod i) = 0 then
      sum := sum + i + (a div i);
    i := i + 1;
  until (sum >= a);

  if (sum = a) then begin
    result := true;
  end else
    result := false;

  check := result;
end;

procedure output(n: boolean);

begin
  if n then begin
    WriteLn('Number is perfect');
  end else
    WriteLn('Number is not perfect');
end;

var
  n : integer;

begin  
  WriteLn('Write your number: ');
  Read(n);
  output(check(n));
end.  