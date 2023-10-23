(* Star patterns          Bohdan Tatarchuk, 23-10-2023
   =============
   This programme print the following patterns:
   a.    b.     c.       d.
   ****  *       *       *
   ****  **     **      ***
   ****  ***   ***     *****
   ****  **** ****    *******
   ===================================================
*)

PROGRAM Patterns;

//Global variables declaration
VAR
  choice, i, n, a: INTEGER;
  star, space: CHAR;

BEGIN //Patterns
  	
  //User input
  WriteLn('Choose a pattern between 1 and 4: ');
  Read(choice);
  WriteLn('Write the number of lines (rows) between 1 and 20: '); //limit was set to 20 in order to avoid runtime errors
  Read(n);

  //Variables initialization
  star := '*';
  space := ' ';

  //Number range check
  IF ((choice > 0) and (choice < 5) and (n > 0) and (n < 21)) THEN BEGIN

    //switch-case structure in java,c#,c++
    CASE choice OF

      //Case 1
      1:

      FOR a := 1 TO n DO BEGIN

        FOR i := 1 TO n DO BEGIN
          Write(star);
        END; //inner loop stands for columns 

        WriteLn(); //Moving to the next row

      END; //outer loop stands for rows

      //Case 2
      2:

      FOR a := 1 TO n DO BEGIN

        FOR i := 1 TO a DO BEGIN
          Write(star);
        END; //inner loop stands for columns 

        WriteLn(); //Moving to the next row

      END; //outer loop stands for rows

      //Case 3
      3:

      FOR a := 1 TO n DO BEGIN

        FOR i := n - 1 DOWNTO a DO BEGIN
          Write(space);
        END; //inner loop 1 stands for spaces at the begin of the line
      
        FOR i := 1 TO a DO BEGIN
          Write(star);
        END; //inner loop 2 stands for stars at the end of the line

        WriteLn(); //Moving to the next row

      END; //outer loop stands for rows

      //Case 4
      4:

      FOR a := 1 TO n DO BEGIN

        FOR i := n - 1 DOWNTO a DO BEGIN
          Write(space);
        END; //inner loop 1 stands for spaces at the begin of the line

        FOR i := 1 TO (a * 2) - 1 DO BEGIN
          Write(star);
        END; //inner loop 2 stands for stars at the end of the line

        WriteLn(); //Moving to the next row

      END; //outer loop stands for rows

    ELSE
      WriteLn('Error: system error'); //safety feature
    END; //Case

  END ELSE BEGIN
    WriteLn('Error: input is out of range');
  END; //If

END. //Patterns