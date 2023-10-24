(* Multiplication Table            Bohdan Tatarchuk, 24-10-2023
   ====================
   This programme print out a multiplication table for positive
   numbers n and m.
   ============================================================
*)

PROGRAM Table;

//Returns smaller number
FUNCTION min(rows, lines: INTEGER): INTEGER;

//Local variables declarartion
VAR
  output: INTEGER;

BEGIN //min

  IF (rows < lines) THEN BEGIN
    output := rows;
  END ELSE BEGIN
    output := lines;
  END; //Check

  min := output;
END; //min

//Returns greater number
FUNCTION max(rows, lines: INTEGER): INTEGER;

//Local variables declarartion
VAR
  output: INTEGER;

BEGIN //max

  IF (rows > lines) THEN BEGIN
    output := rows;
  END ELSE BEGIN
    output := lines;
  END; //Check
  
  max := output;
END; //max

//Global variables declaration
VAR
  n, m, i, a, result: INTEGER;

BEGIN //Table
  //Variable initialization
  result := 0;

  //User input
  WriteLn('Write a number n between 1 and 20: '); //limit was set to 20 in order to avoid runtime errors
  Read(n);
  WriteLn('Write a number m between 1 and 20: '); //limit was set to 20 in order to avoid runtime errors
  Read(m);

  IF ((n > 0) and (n < 21 ) and (m > 0) and (m < 21)) THEN BEGIN

    Write('*  '); //top left corner

    FOR i := min(m, n) TO max(m, n) DO BEGIN
      Write(i, '  '); 
    END; //first line output

    FOR a := min(m, n) TO max(m, n) DO BEGIN

      WriteLn(); //first column output
      Write(a); //first column output
    
      FOR i := min(m, n) TO max(m, n) DO BEGIN
        result := a * i;
        Write('  ', result);
      END; //other columns output (inner for)

    END; //Outer for
    
  END ELSE BEGIN
    WriteLn('Error: number is out of range');
  END; //Number range check

END. //Table