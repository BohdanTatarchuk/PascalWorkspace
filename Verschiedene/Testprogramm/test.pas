(* Diagramm                                                        Bohdan Tatarchuk, 05-11-2023
   --------                     
   Ein Pascal-Programm, das ein druckbares Zeichen ch und eine beliebige Anzahl n
   (zwischen 2 und 40) von ganzen Zahlen (alle im Bereich von 1 bis 10) einliest und die Zahlen in 
   einem Feld speichert. Das Programm zeigt dann für jede der n Zahlen im Feld eine Säule mit der 
   entsprechenden Anzahl von ch-Zeichen an.
   -----------------------------------------------------------------------------------------------
*)

program Saulendiagramm;

const
  MaxAnzahl = 40;
  MinZahl = 1;
  MaxZahl = 10;

type
  VArray = array[1..MaxAnzahl] of integer;

var
  ch: char;
  n, a, maxValue: integer;
  values: VArray;

procedure inputChar(var c: char);
begin
  writeln('Write your character: ');
  readln(c);
end;

procedure inputN(var num: integer);
begin
  writeln('Write an amount of rows: ');
  readln(num);
end;

procedure inputValues(var arr: VArray; n: integer);
var
  i: integer;
begin
    FOR i := 1 TO n DO BEGIN
      WriteLn('Write your values');
      Readln(values[i]);

      //check if the values are between 1 and 10
      IF ((values[i] < 1) or (values[i] > 10)) THEN BEGIN
        WriteLn('Error: value is out of range between 1 and 10');
        exit;
      END;//if
    END; //for
end;

procedure output1(ch: char; Zahlen: VArray; n: integer);
var
  i, j: integer;
begin
  for i := maxValue downto 1 do
  begin
    write(i, '| ');
    for j := 1 to n do
    begin
      if values[j] >= i then
        write(ch, ' ')
      else
        write('  ');
    end;
    writeln;
  end;
end;

procedure output2(ch: char; Zahlen: VArray; n: integer);
var
  i, j: integer;
begin
  for i := maxValue downto 1 do
  begin
    IF (i = 10) THEN BEGIN
      write(i, '| ');
    END ELSE BEGIN
      write(i, ' | ');
    END; (* IF *)
    
    for j := 1 to n do
    begin
      if values[j] >= i then
        write(ch, ' ')
      else
        write('  ');
    end;
    WriteLn();
  end;
end;

procedure design(n: integer);
var
  i: integer;
begin
  
  IF (maxValue = 10) THEN BEGIN
    Write('  +');
  END ELSE BEGIN
    Write(' +');
  END; (* IF *)
  
  FOR i := 1 TO n * 2 DO BEGIN
    Write('-');
  END; //for

  WriteLn(' ');
  Write('  ');

  FOR i := 1 TO n DO BEGIN
    Write(' ', values[i]);
  END; //for

  exit;
end;

begin

  inputChar(ch);
  inputN(n);

  //check if n is between 2 and 40 
  if (n < 2) or (n > 40) then
  begin
    writeln('Error: n must be in range between 2 and 40');
    exit;
  end;

  inputValues(values, n);

  maxValue := 1;
  //Getting the highest value of the array
  FOR a := 1 TO n DO BEGIN
    IF values[a] > maxValue THEN BEGIN
      maxValue := values[a];
    END;
  END;

  IF (maxValue < 10) THEN BEGIN
    output1(ch, values, n);
    design(n);
  END ELSE IF (maxValue = 10) THEN BEGIN
    output2(ch, values, n);
    design(n);
  END ELSE BEGIN
    WriteLn('Error: value is out of range between 1 and 10');
    exit;
  END; 

  WriteLn;

end.