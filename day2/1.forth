100 CONSTANT line
CREATE buffer line allot
CREATE pos 2 cells allot

: entry
  buffer line ;

: next
  entry stdin read-line throw ;

: init
  0 pos !
  0 pos 1 cells + ! ;

vocabulary controls
also controls definitions

: position
  pos @
  pos 1 cells + @ ;

: f pos @ + pos ! ;
: u pos 1 cells + @ swap - pos 1 cells + ! ;
: d pos 1 cells + @ + pos 1 cells + ! position ;

: forward parse-word s>number throw f ;
: up parse-word s>number throw u ;
: down parse-word s>number throw d ;

previous

: interpret
  begin
    next while
      entry drop swap evaluate
    repeat
  drop ;

also controls
init interpret position * . bye
