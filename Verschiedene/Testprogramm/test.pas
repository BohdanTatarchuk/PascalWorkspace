PROGRAM ConcatPrg;

FUNCTION Concat(a, b: String): String;

VAR
  c: String;
  n, m, i: integer;

BEGIN //Concat
  n := Length(a);
  m := Length(b);

  IF (m + n > 255) THEN BEGIN
    WriteLn('Concat: string are too long');
    HALT;
  END; (* IF *)

  c[0] := chr(n + m); 

  FOR i := 1 TO n DO BEGIN
    c[i] := a[i];
  END; (* FOR *)

  FOR i := 1 TO m DO BEGIN
    c[i + n] := b[i];
  END; (* FOR *)

  Concat := c;
END; //Concat

VAR
  a, b, c: String;

BEGIN (* ConcatPrg *)
  Write('a >'); ReadLn(a);
  Write('b >'); ReadLn(b);
  c := Concat(a, b);
  WriteLn(c);
  WriteLn('Length: ',Length(c));

END. (* ConcatPrg *)