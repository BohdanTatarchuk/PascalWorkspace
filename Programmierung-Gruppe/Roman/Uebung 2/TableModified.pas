(* Multiplication Table (modified)           Bohdan Tatarchuk, 24-10-2023
   ===============================
   This programme print out a multiplication table for positive
   numbers n1, n2 and m1, m2.
   =======================================================================
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
  n1, n2, m1, m2, i, a, result: INTEGER;

BEGIN //Table
  //Variable initialization
  result := 0;

  //User input
  WriteLn('Write a number n1 between 1 and 20: '); //limit was set to 20 in order to avoid runtime errors
  Read(n1);
  WriteLn('Write a number m1 between 1 and 20: '); //limit was set to 20 in order to avoid runtime errors
  Read(m1);
  WriteLn('Write a number n2 between 1 and 20: '); //limit was set to 20 in order to avoid runtime errors
  Read(n2);
  WriteLn('Write a number m2 between 1 and 20: '); //limit was set to 20 in order to avoid runtime errors
  Read(m2);


  IF ((n1 > 0) and (n1 < 21 ) and (m1 > 0) and (m1 < 21)
   and (n2 > 0) and (n2 < 21 ) and (m2 > 0) and (m2 < 21)) THEN BEGIN

    Write('*  '); //top left corner

    FOR i := min(m1, n1) TO max(m1, n1) DO BEGIN
      Write(i, '  '); 
    END; //first line output

    FOR a := min(m2, n2) TO max(m2, n2) DO BEGIN

      WriteLn(); //first column output
      Write(a); //first column output
    
      FOR i := min(m1, n1) TO max(m1, n1) DO BEGIN
        result := a * i;
        Write('  ', result);
      END; //other columns output (inner for)

    END; //Outer for
    
  END ELSE BEGIN
    WriteLn('Error: number is out of range');
  END; //Number range check

END. //Table