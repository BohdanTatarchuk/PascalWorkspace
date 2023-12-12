program test;

var
  str: String;

begin
  str := 'Hagenberg';
  str[0] := chr(length(str) - 1);
  WriteLn(str);
end.
