program test;

var 
  ptr: ^integer;
  a: integer;
begin
  a := 17;
  ptr := @a;
  writeln(ptr^);
  ptr^ := 4;
  Writeln(a);

  Writeln(longint(@a));
  Writeln(longint(@ptr));
end.