PROGRAM vovelPrg;

FUNCTION deleteVovel(s: String): String;

VAR
  c: String;
  i, j, a: integer;
  vovels: ARRAY [1..10] OF CHAR;

BEGIN (* deleteVovel *)

  //small letters
  vovels[1] := 'a';
  vovels[2] := 'e';
  vovels[3] := 'u';
  vovels[4] := 'o';
  vovels[5] := 'i';

  //capital letters
  vovels[6] := 'A';
  vovels[7] := 'E';
  vovels[8] := 'U';
  vovels[9] := 'O';
  vovels[10] := 'I';

  FOR i := 1 TO length(s) DO BEGIN
    FOR j := 1 TO high(vovels) DO BEGIN
      WHILE (i <= length(s)) and (s[i] = vovels[j]) DO BEGIN
        FOR a := i TO length(s) - 1 DO BEGIN
          s[a] := s[a + 1];
        END; //for
        s[0] := chr(Length(s) - 1);
      END; //while
    END; //inner for
  END; //outer for

  deleteVovel := s;

END; (* deleteVovel *)

VAR
  s: String;

BEGIN (* vovelPrg *)
  WriteLn('Write a word'); ReadLn(s);
  WriteLn(deleteVovel(S));
END. (* vovelPrg *)