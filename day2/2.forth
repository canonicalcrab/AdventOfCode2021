100 CONSTANT line
CREATE buffer line allot
CREATE pos 3 cells allot

: entry
  buffer line ;

: next
  entry stdin read-line throw ;

: depth pos @ ;
: depth! pos ! ;
: horizontal pos 1 cells + @ ;
: horizontal! pos 1 cells + ! ;
: aim pos 2 cells + @ ;
: aim! pos 2 cells + ! ;

: init
  0 depth!
  0 horizontal!
  0 aim! ;

: position
  depth
  horizontal ;

: f 
  dup 
  depth + depth!
  aim * horizontal + horizontal! ;

: u aim swap - aim! ;
: d aim + aim! ;

: forward parse-word s>number throw f ;
: up parse-word s>number throw u ;
: down parse-word s>number throw d ;

: interpret
  begin
    next while
      entry drop swap evaluate
    repeat
  drop ;

init interpret position * . bye
