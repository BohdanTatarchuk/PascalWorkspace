PROGRAM syntaxTest;

VAR
  x, y, z: integer;
  a,b,c: boolean;


BEGIN (* syntaxTest *)
  c := not not a;
  c := not (not a);
  z := - - x;
  Z := - (-x);
  z := + + x;

  //c := x >= 0 and y >= 0; doesnt work

  c := (x >= 0) and ( y >= 0);
  
END. (* syntaxTest *)