(* Dynamische Datenstruktur                                             Bohdan Tatarchuk, 07-12-2023
   ------------------------               
   Für eine Textverarbeitungssoftware wird eine dynamische Datenstruktur benötigt, in der eine 
   Sequenz von beliebig vielen Wörtern (vom Datentyp STRING) in Form einer einfach-verketteten Liste
   gespeichert werden kann. 
   -------------------------------------------------------------------------------------------------
*)

Program dynamischeDatenstruktur;

CONST
  maxWordLength = 20;

TYPE
  WordNodePtr = ^WordNode;
  WordNode = RECORD
                next: WordNodePtr;
                words: string[maxWordLength];
             END; (* WordNode *)
  WordListPtr = WordNodePtr;

function NewWordList: WordListPtr; //returns empty list
begin
  NewWordList := nil;
end;

function NewNode(s: string): WordNodePtr; //creates a new node
var 
  n: WordNodePtr;

begin
  New(n);
  n^.words := s;
  n^.next := nil;
  NewNode := n;
end;

procedure AppendWord(var wl: WordListPtr; s: string); //appends s at the end of list wl
var
  current, n: WordNodePtr;

begin
  n := NewNode(s);

  if (wl <> nil) then begin
    current := wl;

    while (current^.next <> nil) do
      current := current^.next;
    
    current^.next := n;
  end else 
    wl := n;
end;

procedure input(var wl: WordListPtr);
var
  s: string;

begin
  s := '';
  WriteLn('Write ++ to finish the input');
  while (s <> '++') do begin
    WriteLn('Write a word (up to 20 symbols): ');
    ReadLn(s);
    if Length(s) > maxWordLength then begin
      WriteLn('Error: word is longer then 20 symbols');
      exit;
    end;
    AppendWord(wl, s);
  end;
end;

procedure DisposeWordList(var wl: WordListPtr); //disposes all nodes and sets wl to empty list
var 
  succ: WordNodePtr;

begin
  while (wl <> nil) do begin
    succ := wl^.next;
    Dispose(wl);
    wl := succ;
  end;

  wl := nil;
end;

function WordListLength(wl: WordListPtr): INTEGER; //returns number of characters in wl (i.e. all characters of all words and one space between two words)
var
  sum: integer;

begin
  sum := 0;

  while (wl <> nil) do begin
    sum := sum + length(wl^.words) + 1; //length of the word + space between
    wl := wl^.next;
  end;

  WordListLength := sum;
end;

procedure PrintWordList(wl: WordListPtr); //prints all words separated by a single space character
begin
  if (wl <> nil) then begin
    while (wl <> nil) do begin
      Write(wl^.words, ' ');
      wl := wl^.next;
    end;
  end else begin
    WriteLn('Error: list cant be printed, because its empty');
    exit;
  end;
end;

function CopyWordList(wl: WordListPtr): WordListPtr; //copies all nodes of wl and returns head of new list
var
  wlCopy: WordListPtr;

begin
  wlCopy := NewWordList;
  while(wl <> nil) do begin
    AppendWord(wlCopy, wl^.words);
    wl := wl^.next;
  end;
  CopyWordList := wlCopy;
end;

procedure SplitWordList(var wl, wl2: WordListPtr; pos: INTEGER); //splits wl
var
  sum, currentPos: integer;
  currentWord: WordNodePtr;

begin
  sum := WordListLength(wl);
  currentPos := 0;
  wl2 := NewWordList;
  currentWord := wl;
  if sum > 0 then begin
    if pos <= sum then begin
      while (currentWord <> nil) do begin
        currentPos := currentPos + Length(currentWord^.words) + 1;
        if (currentPos >= pos) then begin
          AppendWord(wl2, currentWord^.words);
        end;
        currentWord := currentWord^.next;
      end;
    end else begin
      Writeln('Error: position doesnt exist');
      exit;
    end;
  end else begin
    Writeln('Error: list cant be splitted because its empty');
    exit;
  end;
end;

var 
  list, listCopy, partOfList: WordListPtr;
  pos: integer;

begin
  list := NewWordList;
  input(list);
  WriteLn('Write a position to split the list: '); Read(pos);
  listCopy := CopyWordList(list);
  SplitWordList(list, partOfList, pos);

  WriteLn('Original: '); PrintWordList(list); Writeln;
  //WriteLn('Copy: '); PrintWordList(listCopy); Writeln;
  WriteLn('Splitted List: '); PrintWordList(partOfList); Writeln;
  WriteLn('Length original: ', WordListLength(list));
  //WriteLn('Length copy: ', WordListLength(listCopy));
  WriteLn('Length splitted: ', WordListLength(partOfList));
  
  DisposeWordList(list);
  DisposeWordList(listCopy);
  DisposeWordList(partOfList);
end.