(* Diagramm                                                        Bohdan Tatarchuk, 05-11-2023
   --------                     
   Ein Pascal-Programm, das ein druckbares Zeichen ch und eine beliebige Anzahl n
   (zwischen 2 und 40) von ganzen Zahlen (alle im Bereich von 1 bis 10) einliest und die Zahlen in 
   einem Feld speichert. Das Programm zeigt dann für jede der n Zahlen im Feld eine Säule mit der 
   entsprechenden Anzahl von ch-Zeichen an.
   -----------------------------------------------------------------------------------------------
*)

PROGRAM Diagram;

//global variables
VAR
  ch: CHAR;
  n, i, j, a, maxValue: INTEGER; 
  values: ARRAY OF INTEGER;

BEGIN //Diagram
  //Input
  WriteLn('Write your character: ');
  Read(ch);
  WriteLn('Write an amount of rows: ');
  Read(n);

  SetLength(values, n); //custom length of the array 

  //check if n is between 2 and 40 
  IF (n >= 2) and (n <= 40) THEN BEGIN
    WriteLn('Write ', n, ' values in range from 1 to 10, one per line: ');
    readln();

    //array values input
    FOR i := 0 TO n - 1 DO BEGIN
      Readln(values[i]);

      //check if the values are between 1 and 10
      IF ((values[i] >= 1) and (values[i] <= 10)) THEN BEGIN
        
      END ELSE BEGIN
        WriteLn('Error: value is out of range between 1 and 10');
        exit;
      END; //If
    END; //for
  END ELSE BEGIN
    exit;
    WriteLn('Error: n must be in range between 2 and 40');
  END; //if
  
  //initialization to avoid warning
  maxValue := values[0];
  
  //Getting the highest value of the array
  FOR a := 0 TO n - 1 DO BEGIN
    IF values[a] > maxValue THEN BEGIN
      maxValue := values[a];
    END;
  END;

  //Design
  IF (maxValue < 10) THEN BEGIN
  
    FOR i := maxValue DOWNTO 1 DO BEGIN
      Write(i, '| ');
      FOR j := 1 TO n DO BEGIN
        IF (values[j] >= i) THEN BEGIN
          Write(ch, ' ');
        END ELSE BEGIN
          Write('  ');  
        END; //if
      END; //inner for
      WriteLn();
    END; //outer for

    Write(' +');
    FOR i := 1 TO n * 2 DO BEGIN
      Write('-');
    END; //for

    WriteLn(' ');
    Write('  ');

    FOR i := 0 TO n - 1 DO BEGIN
      Write(' ', values[i]);
    END; //for

    WriteLn();
  END ELSE BEGIN

    WriteLn(maxValue, '| ');

    FOR i := maxValue - 1 DOWNTO 1 DO BEGIN
      WriteLn(i, ' | ');
    END; //for

    Write('  +');
    FOR i := 1 TO n * 2 DO BEGIN
      Write('-');
    END; //for

    WriteLn(' ');
    Write('  ');

    FOR i := 0 TO n - 1 DO BEGIN
      Write(' ', values[i]);
    END; //for

    WriteLn();
  END; //if
END. //Diagram