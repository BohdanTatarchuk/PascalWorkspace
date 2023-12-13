program WordFrequency;

TYPE
  WordNodePtr = ^WordNode;
  WordNode = record
              prev, next: WordNodePtr;
              item: string;
              n: integer;
  end; 
  WordListPtr = WordNodePtr;

function NewWordList: WordListPtr; //returns empty list
var 
  x: WordNodePtr;
begin
  New(x);
  x^.item := '';
  x^.n := 1;
  x^.next := x;
  x^.prev := x;
  NewWordList := x;
end;

function NewNode(item: string; number: integer): WordNodePtr;
var 
  x: WordNodePtr;
begin
  New(x);
  x^.item := item;
  x^.n := number;
  x^.next := x;
  x^.prev := x; 
  NewNode := x;
end;

procedure AppendWord(var wl: WordListPtr; s: string); //appends s at the end of list wl
var
  n: WordNodePtr;
begin
  n := NewNode(s, 1);
  n^.next := wl;
  n^.prev := wl^.prev;
  wl^.prev^.next := n;
  wl^.prev := n;
end;

procedure input(var wl: WordListPtr); //fills the list
var
  s: string;
  current: WordNodePtr;

begin
  s := '';
  WriteLn('Write ++ to finish the input');
  
  current := wl;
  repeat
    WriteLn('Write a word: ');
    ReadLn(s);
    if s <> '++' then begin
      current := wl^.next;
      while (current <> wl) and (current^.item <> s) do
        current := current^.next;
        if current <> wl then
          Inc(current^.n)
        else
          AppendWord(wl, s);
    end;
  until s = '++';
end;

procedure process(var wl: WordListPtr); //deletes words from the list, which have frequency 1
var 
  current, nextNode: WordNodePtr;
  
begin
  if wl = nil then
    exit;

  current := wl^.next;

  repeat
    nextNode := current^.next;

    if current <> wl then begin
      if current^.n = 1 then begin
        current^.prev^.next := nextNode;
        nextNode^.prev := current^.prev;
        Dispose(current);
      end;
    end;

    current := nextNode;
  until current = wl;
end;

procedure output(wl: WordNodePtr); //outputs words and their frequencies
var
  current: WordNodePtr;

begin
  if wl = nil then
    exit;

  current := wl^.next;

  while current <> wl do begin
    writeln('Word: ', current^.item, ', Frequency: ', current^.n);
    current := current^.next;
  end;
end;

procedure DisposeWordList(var wl: WordListPtr); //disposes the list
var 
  current, nextNode: WordNodePtr;
begin
  if wl = nil then
    exit;

  current := wl^.next;

  repeat
    nextNode := current^.next;

    if current <> wl then begin
      current^.prev^.next := nextNode;
      nextNode^.prev := current^.prev;
      Dispose(current);
    end;

    current := nextNode;
  until current = wl;

  wl := nil;
end;

var 
  l: WordListPtr;

begin
  l := NewWordList;
  Input(l);
  process(l);
  Output(l);
  DisposeWordList(l);
end.
