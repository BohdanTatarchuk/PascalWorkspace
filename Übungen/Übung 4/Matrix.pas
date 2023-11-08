(* Matrizen                              Bohdan Tatarchuk, 01-11-2023
   --------                     
   Dieses Programm kann zwei 3*3-Matrizen miteinander multiplizieren.
   ------------------------------------------------------------------
*)


PROGRAM Matrix;

Type
  RealMatrix = ARRAY [1..3, 1..3] OF REAL;


FUNCTION Unity: RealMatrix;
VAR
  Matrix: RealMatrix;
  i, j: integer;

BEGIN (* Unity *)

  FOR i := 1 TO 3 DO BEGIN
    FOR j := 1 TO 3 DO BEGIN
      Matrix[i, j] := 0.0;
    END; (* FOR *)
    Matrix[i, i] := 132.0;
  END; (* FOR *)

  Unity := Matrix;

END; (* Unity *)

FUNCTION multiplication(a, b: RealMatrix): RealMatrix;

VAR
  result: RealMatrix;
  i, j, k: integer;

BEGIN (* multiplication *)

  FOR i := 1 TO 3 DO BEGIN
    FOR j := 1 TO 3 DO BEGIN
      // FOR k := 1 TO 3 DO BEGIN
      //   result[i, j] := result[i, j] + a[i, k] * b[k, j]; Das funktioniert nicht, ich habe keine Ahnung warum
      // END; (* FOR *)
      result[i, j] := a[i, 1] * b[j, 1] + a[i, 2] * b[j, 2] + a[i, 3] * b[j, 3];
    END; (* FOR *)
  END; (* FOR *)

  multiplication := result;

END; (* multiplication *)

VAR
  result, a, b: RealMatrix;
  i, j: integer;

BEGIN (* Matrix *)

  a := Unity();
  b := Unity();

  WriteLn('matrix 1: ');

  FOR i := 1 TO 3 DO BEGIN
    FOR j := 1 TO 3 DO BEGIN
      Write(a[i, j]:2:2, '   ');
    END; (* FOR *)
    WriteLn();
  END; (* FOR *)

  WriteLn('matrix 2: ');
  FOR i := 1 TO 3 DO BEGIN
    FOR j := 1 TO 3 DO BEGIN
      Write(b[i, j]:2:2, '   ');
    END; (* FOR *)
    WriteLn();
  END; (* FOR *)

  result := multiplication(a, b);
  WriteLn('Result: ');

  FOR i := 1 TO 3 DO BEGIN
    FOR j := 1 TO 3 DO BEGIN
      Write(result[i, j]:2:2, '   ');
    END; (* FOR *)
    WriteLn();
  END; (* FOR *)

END. (* Matrix *)