: not ( flag )
  -1 = if 0 else -1 then ;

VARIABLE chosen
VARIABLE last
: choose ( number -- )
  dup last !
  1 swap lshift chosen +! ;
: chosen? ( number -- flag ) 1 swap lshift chosen @ and 0 > ;

5 cells CONSTANT column
5 cells CONSTANT row
column row * CONSTANT board
: columns ( addr column -- addr ) cells + ;
: rows ( addr row -- addr ) column * + ;
: boards ( addr idx -- addr ) board * + ;

: 5chosen? ( addr increment -- 5chosen? )
  -1 5 0
  ?DO
    0 2over
    i * + @ chosen? nip and
  LOOP 
  nip nip ;

: 5row? ( board -- board 5row? )
  0 row 0
  ?DO
    over
    i rows 1 cells 5chosen? or
  LOOP ;

: 5column? ( board -- board 5column? )
  0 column 0
  ?DO
    over
    i columns row 5chosen? or
  LOOP ;

: win? ( board -- flag )
  5row? IF -1 ELSE
  5column? IF -1 ELSE
  0 THEN THEN nip ;

: score ( board -- score )
  0 
  board 1 cells dup * / 1 + ( loop by number of places in board )
  0
  ?DO
    over i cells + @
    chosen? not IF i +
  THEN LOOP
  last @ * nip ;

CREATE example
  1  , 2  , 3  , 4  , 5  ,
  6  , 7  , 8  , 9  , 10 ,
  11 , 12 , 13 , 14 , 15 ,
  16 , 17 , 18 , 19 , 20 ,
  21 , 22 , 23 , 24 , 25 ,

  25 , 24 , 23 , 22 , 21 ,
  20 , 19 , 18 , 17 , 16 ,
  15 , 14 , 13 , 12 , 11 ,
  10 , 9  , 8  , 7  , 6  ,
  5  , 4  , 3  , 2  , 1  ,

