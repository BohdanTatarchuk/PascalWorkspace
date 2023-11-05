(* Matrizen                                                          Bohdan Tatarchuk, 05-11-2023
   --------                     
    Dieses Programm löst folgendes Rätsel:
    "In einem Raum gibt es 100 Lampen, nummeriert von 1 bis 100, die zunächst ausgeschaltet 
    sind. Es gibt auch 100 Personen, ebenfalls nummeriert von 1 bis 100. Person 1 geht durch den 
    Raum und betätigt alle Schalter, sodass alle Lampen eingeschaltet werden. Dann geht Person 
    2 durch den Raum und betätigt den Schalter jeder zweiten Lampe, um sie auszuschalten (d.h.
    Lampe Nr. 2, Nr. 4, Nr. 6 usw.). Dann geht Person 3 durch den Raum und betätigt den Schalter 
    jeder 3. Lampe. 
    Welche Lampen sind eingeschaltet, nachdem 100 Personen die Schalter betätigt haben?"
   -----------------------------------------------------------------------------------------------
*)


PROGRAM Lampn; 

//Global variable
VAR
  lampen: ARRAY[1..100] OF BOOLEAN;


PROCEDURE arrayInput;
//Local variable
VAR
  i: INTEGER;

BEGIN //arrayInput

  FOR i := 1 TO 100 DO BEGIN
    lampen[i] := false; //turn off every lamp
  END;//for

END; //arrayInput


PROCEDURE OnOff;
//Local variables
VAR
  person, lampe: INTEGER;

BEGIN//OnOff

  FOR person := 1 TO 100 DO BEGIN
    lampe := person;

    WHILE lampe <= 100 DO BEGIN
      lampen[lampe] := not lampen[lampe];
      lampe := lampe + person;
    END; //while

  END;//for

END;//OnOff


PROCEDURE output;
//Local variable
VAR
  i: INTEGER;

BEGIN
  Writeln('Toggled on lamps: ');

  FOR i := 1 TO 100 DO BEGIN

    IF lampen[i] THEN BEGIN
      WriteLn(i, ' ');
    END;//if

  END;//for

END;

BEGIN //Lampen

  arrayInput; //calling procedure "arrayInput" to fill the the array with 100 booleans
  OnOff; //toggling
  output; //output of the result

END. //Lampen