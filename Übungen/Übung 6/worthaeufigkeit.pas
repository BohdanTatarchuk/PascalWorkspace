Program Worthaeufigkeit;
TYPE
  WordNodePtr = ^WordNode;
  WordNode =  RECORD
                prev, next: WordNodePtr;
                item: STRING;
                n: INTEGER;
              END; 
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

function NewNode(item: string; number: integer): WordNodePtr; //creates a new node
var 
  x: WordNodePtr;

begin
  New(x);
  x^.item := item;
  x^.n := number;
  x^.next := nil;
  x^.prev := nil;
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

procedure input(var wl: WordListPtr);
var
  s: string;

begin
  s := '';
  WriteLn('Write ++ to finish the input');
  while (s <> '++') do begin
    WriteLn('Write a word: ');
    ReadLn(s);
    AppendWord(wl, s);
  end;
end;

procedure output(wl: WordListPtr);
var 
  current: WordNodePtr;
begin
  current := wl^.next;
  while (current <> wl) do begin
    Write(wl^.item, ',', wl^.n, ' ');
    current := current^.next;
  end;
end;

procedure DisposeWordList(var wl: WordListPtr); //disposes all nodes and sets wl to empty list
var 
  current: WordNodePtr;

begin
  current := wl^.next;
  while (current <> wl) do begin
    Dispose(current);
    current := current^.next;
  end;

  wl := nil;
end;

var 
  l: WordListPtr;

begin //main
  l := NewWordList;
  input(l);
  output(l);
  DisposeWordList(l);
end.