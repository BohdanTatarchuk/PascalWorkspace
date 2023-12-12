(* Buchstabensalat                                                    Bohdan Tatarchuk, 27-11-2023
   ------------------                     
   Ein Pascal-Programm, das eine Zeichenkette s einliest, die Buchstaben der in s
   enthaltenen Wörter umordnet und anschließend die Zeichenkette s wieder ausgibt. 
   -----------------------------------------------------------------------------------------------
*)

PROGRAM Buchstabensalat;

procedure swap(var a, b: char); //swaf of two chars
var
  temp: char;

begin
  temp := a;
  a := b;
  b := temp;
end;

procedure invert(var item: string); //inverts the given string (item)
var
  min, max: integer;

begin
  if Length(item) > 3 then begin //we dont invert the strings, the length of which is smaller then 3
    min := 2; //dont change the first letter
    max := Length(item) - 1; //dont change the last letter

    while min < max do begin
      swap(item[min], item[max]);

      Inc(min);
      Dec(max);
    end; //while
  end; //if
end;
 
var //global variables declaration
  inputString, invertedString: string;
  currentWord: string;
  i: integer;

begin
  Write('Write your string: '); ReadLn(inputString); //input
  
  invertedString := ''; 
  i := 1; 

  while i <= Length(inputString) do begin //going through the inputString
    currentWord := ''; 

    //creating a separate word till space
    while (i <= Length(inputString)) and (inputString[i] <> ' ') do begin
      currentWord := currentWord + inputString[i];
      Inc(i);
    end;

    invert(currentWord); //join all words to create the result string
    invertedString := invertedString + currentWord;

    if i <= Length(inputString) then //creating spaces between words
      invertedString := invertedString + ' ';

    Inc(i);
  end;

  WriteLn('Processed string: ', invertedString); //output
end.
