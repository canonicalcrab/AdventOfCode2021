5 CONSTANT line
CREATE buffer line 2 + allot
CREATE window 3 cells allot

: >number s>number throw ;

: entry
  buffer line ;

: next
  entry stdin read-line throw ;

: if-increased
  rot over < if swap 1 + else swap then ;

: pane
  window swap cells + ;

: next-window
  1 pane @ 2 pane !
  0 pane @ 1 pane !
  entry >number 0 pane ! ;

: sum
  0 pane @
  1 pane @ +
  2 pane @ + ;

: init
  next-window
  next-window
  next-window ;

: count
  0 0
  init
  begin
    next while
      drop
      next-window
      sum if-increased
    repeat
  drop ;

count . bye
