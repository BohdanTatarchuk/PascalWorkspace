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
      Matrix[i, j] := 0;
    END; (* FOR *)
    Matrix[i, i] := 1.0;
  END; (* FOR *)

  Unity := Matrix;

END; (* Unity *)

FUNCTION Unity2: RealMatrix;
VAR
  Matrix: RealMatrix;
  i, j: integer;

BEGIN (* Unity *)

  FOR i := 1 TO 3 DO BEGIN
    FOR j := 1 TO 3 DO BEGIN
      Matrix[i, j] := 2.0;
    END; (* FOR *)
    Matrix[i, i] := 5.0;
  END; (* FOR *)

  Unity2 := Matrix;

END; (* Unity *)

FUNCTION multiplication(a, b: RealMatrix): RealMatrix;

VAR
  result: RealMatrix;
  i, j, k: integer;

BEGIN (* multiplication *)

  FOR i := 1 TO 3 DO BEGIN
    FOR j := 1 TO 3 DO BEGIN

      result[i, j] := a[i, 1] * b[j, 1] + a[i, 2] * b[j, 2] + a[i, 3] * b[j, 3];

    END; (* FOR *)
  END; (* FOR *)

  multiplication := result;

END; (* multiplication *)

VAR
  result, a, b: RealMatrix;
  i, j: integer;

BEGIN (* Matrix *)

  a := Unity2();
  b := Unity2();

  result := multiplication(a, b);

  FOR i := 1 TO 3 DO BEGIN
    FOR j := 1 TO 3 DO BEGIN
      Write(result[i, j]:2:2, '   ');
    END; (* FOR *)
    WriteLn();
  END; (* FOR *)

END. (* Matrix *)