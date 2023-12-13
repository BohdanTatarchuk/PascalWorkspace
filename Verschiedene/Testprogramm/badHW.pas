program WordFrequency;

type
  WordNodePtr = ^WordNode;
  WordNode = record
    prev, next: WordNodePtr;
    word: string;
    n: integer; (* frequency of word *)
  end;

procedure AddWord(var head: WordNodePtr; newWord: string);
var
  currentNode, newNode: WordNodePtr;
begin
  currentNode := head;

  // Check if the list is empty
  if head = nil then
  begin
    newNode := new(WordNodePtr);
    newNode^.word := newWord;
    newNode^.n := 1;
    newNode^.prev := newNode;
    newNode^.next := newNode;
    head := newNode;
    Exit;
  end;

  repeat
    if currentNode^.word = newWord then
    begin
      Inc(currentNode^.n);
      Exit;
    end;
    currentNode := currentNode^.next;
  until currentNode = head;

  newNode := new(WordNodePtr);
  newNode^.word := newWord;
  newNode^.n := 1;
  newNode^.prev := head^.prev;
  newNode^.next := head;
  head^.prev^.next := newNode;
  head^.prev := newNode;
  head := newNode;
end;


procedure RemoveSingleOccurrences(var head: WordNodePtr);
var
  currentNode, nextNode: WordNodePtr;
begin
  if head = nil then
    Exit;

  currentNode := head;

  repeat
    nextNode := currentNode^.next;

    if currentNode^.n = 1 then
    begin
      if currentNode = head then
        head := nextNode;

      currentNode^.prev^.next := nextNode;
      nextNode^.prev := currentNode^.prev;

      dispose(currentNode);
    end;

    currentNode := nextNode;
  until currentNode = head;
end;

procedure PrintWordFrequencies(head: WordNodePtr);
var
  currentNode: WordNodePtr;
begin
  if head = nil then
    Exit;

  currentNode := head;

  repeat
    writeln('Word: ', currentNode^.word, ', Frequency: ', currentNode^.n);
    currentNode := currentNode^.next;
  until currentNode = head;
end;

var
  head: WordNodePtr;

procedure ProcessWords;
var
  inputWord: string;
begin
  head := nil;

  writeln('Enter words (type "exit" to finish):');
  repeat
    readln(inputWord);
    if inputWord <> 'exit' then
      AddWord(head, inputWord);
  until inputWord = 'exit';

  RemoveSingleOccurrences(head);
  PrintWordFrequencies(head);
end;

begin
  ProcessWords;
end.
