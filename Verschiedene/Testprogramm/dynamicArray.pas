program dynamicArray;

type
  IntArray = array[1..1] of integer; //static array with one element

var 
  arrPtr: ^IntArray; //pointer to dynamic array
  n, i: integer;

begin
  WriteLn('Number of elements required: ');
  Read(n);

  if n <= 0 then begin
    WriteLn('only positive value allowed');
    Halt;
  end;

  GetMem(arrPtr, n * sizeOf(integer)); //reserve n * 2 bytes of memory for our dynamic array 

  for i := 1 to n do (*$R-*) //compiler directive: deactivate range-check for access outside of array
    arrPtr^[i] := 0;
  (*$R+*)
  FreeMem(arrPtr, n * sizeOf(integer));
end.