program ConcatenationExampleNoPlus;

function ConcatStrings(str1, str2: String): String;
var
  len1, len2, totalLength, i: Integer;
  Result: String;
begin
  // Get the lengths of the input strings
  len1 := Length(str1);
  len2 := Length(str2);

  // Calculate the total length of the new string
  totalLength := len1 + len2;

  // Set the length of the result string
  for i:=1 to totalLength do begin
    result[i]:=' ';
  end;

  // Copy characters from the first string
  for i := 1 to len1 do
    Result[i] := str1[i];

  // Copy characters from the second string
  for i := 1 to len2 do
    Result[len1 + i] := str2[i];

  ConcatStrings := Result;
end;

var
  str1, str2, resultStr: String;

begin
  str1 := 'Hello, ';
  str2 := 'Pascal!';

  // Call the custom concatenation function
  resultStr := ConcatStrings(str1, str2);

  // Display the result
  WriteLn('Concatenated String: ', resultStr);
end.