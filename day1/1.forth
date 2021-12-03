5 CONSTANT line
CREATE buffer line 2 + allot

: entry
  buffer line ;

: next
  entry stdin read-line throw ;

: if-increased
  rot over < if swap 1 + else swap then ;

: count
  0 0
  begin
    next while
      drop
      entry s>number throw
      if-increased
    repeat 
  drop ;

count . bye
