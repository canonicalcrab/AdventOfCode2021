100 CONSTANT line
CREATE buffer line allot
CREATE lines 1 cells allot
CREATE last 12 cells allot

( input sum-rows dup mark decimal swap unmark decimal * . )

: init
  -1 lines ! 
  
  12 0
  ?DO
    0 last i cells + !
  LOOP ;

: entry buffer line ;
: next entry stdin read-line throw ;

: counting-lines
  1 lines +! ;

: >number s>number throw ;

: digits
  swap over dup cells allot 0
  ?DO
    dup i chars + 1
    >number
    here i cells + !
  LOOP
  drop
  here swap ;

: exp ( x n -- x^n )
  dup 0 = IF 2drop 1 ELSE
  over swap 1 - 0
  ?DO
    over *
  LOOP
  nip
  THEN ;
    

: >decimal
  0 12 0
  ?DO
   over i cells + @
   2 11 i - exp
   * +
  LOOP
  nip ;
    

: add
  0
  ?DO
    dup i cells + @
    last i cells + @ + 
    last i cells + !
  LOOP
  drop ;

: sum-rows
  begin
    counting-lines
    next while
      entry drop swap 
      digits add
    repeat
  drop ;

: mark
  12 0
  ?DO
    dup i cells + @ 
    lines @ 2 / > 1 +
    over i cells + !
  LOOP ;

: flip
  12 0
  ?DO
    dup i cells + @
    1 = 1 +
    over i cells + !
  LOOP ;

: gamma last mark ;
: >epsilon flip ;

init sum-rows gamma dup >decimal swap >epsilon >decimal * cr . cr bye
