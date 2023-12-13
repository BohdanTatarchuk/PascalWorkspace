program WordFrequencySelfOrganizing;

TYPE
  WordNodePtr = ^WordNode;
  WordNode = record
    prev, next: WordNodePtr;
    item: string;
    n: integer;
  end;
  WordListPtr = WordNodePtr;

function NewWordList: WordListPtr;
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

procedure MoveToTop(var wl: WordListPtr; node: WordNodePtr);
begin
  node^.prev^.next := node^.next;
  node^.next^.prev := node^.prev;

  node^.next := wl;
  node^.prev := wl^.prev;
  wl^.prev^.next := node;
  wl^.prev := node;

  wl := node;
end;

procedure AppendWord(var wl: WordListPtr; s: string);
var
  n: WordNodePtr;
begin
  n := NewNode(s, 1);
  n^.next := wl;
  n^.prev := wl^.prev;
  wl^.prev^.next := n;
  wl^.prev := n;
end;

procedure Input(var wl: WordListPtr);
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

    if s <> '++' then
    begin
      current := wl^.next;
      while (current <> wl) and (current^.item <> s) do
        current := current^.next;

      if current <> wl then
      begin
        Inc(current^.n);
        MoveToTop(wl, current);
      end
      else
        AppendWord(wl, s);
    end;
  until s = '++';
end;

function CountNodes(wl: WordListPtr): integer;
var
  current: WordNodePtr;
  count: integer;
begin
  if wl = nil then
  begin
    CountNodes := 0;
    exit;
  end;

  count := 0;
  current := wl^.next;

  while current <> wl do
  begin
    Inc(count);
    current := current^.next;
  end;

  CountNodes := count;
end;

procedure process(var wl: WordListPtr);
var
  current, nextNode: WordNodePtr;
begin
  if wl = nil then
    exit;

  current := wl^.next;

  while current <> wl do
  begin
    nextNode := current^.next;

    if current^.n = 1 then
    begin
      current^.prev^.next := nextNode;
      nextNode^.prev := current^.prev;
      Dispose(current);
    end;

    current := nextNode;
  end;
end;

procedure output(wl: WordNodePtr);
var
  current: WordNodePtr;
begin
  if wl = nil then begin
    writeln('List is empty.');
    exit;
  end;

  current := wl^.next;

  while current <> wl do begin
    writeln('Word: ', current^.item, ', Frequency: ', current^.n);
    current := current^.next;
  end;
end;

procedure DisposeWordList(var wl: WordListPtr);
var
  current, nextNode: WordNodePtr;
begin
  if wl = nil then
    exit;

  current := wl^.next;

  while current <> wl do
  begin
    nextNode := current^.next;

    if current <> wl then
    begin
      current^.prev^.next := nextNode;
      nextNode^.prev := current^.prev;
      Dispose(current);
    end;

    current := nextNode;
  end;

  wl := nil;
end;

var
  l: WordListPtr;

begin
  l := NewWordList;
  Input(l);
  writeln('After input:');
  output(l);
  process(l);
  writeln('After processing, node count: ', CountNodes(l));
  output(l);
  DisposeWordList(l);
end.
