5 CONSTANT line
CREATE buffer line 2 + allot

: current-entry
  buffer line ;

: next
  current-entry stdin read-line throw ;

: if-increased
  rot over < if swap 1 + else swap then ;

: count
  0 0
  begin
    next while
      drop
      current-entry s>number throw
      if-increased
    repeat 
  drop ;

count . bye
