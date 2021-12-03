5 CONSTANT max-line
CREATE line-buffer max-line 2 + allot

: current-entry
  line-buffer max-line ;

: next-entry
  current-entry stdin read-line throw ;

: as-number s>number throw ;

: if-increased
  rot over < if swap 1 + else swap then ;

: count-increased 
  0 0
  begin
    next-entry while
      drop
      current-entry as-number
      if-increased
    repeat 
  drop 1 - ;

count-increased . bye
