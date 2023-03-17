\ define bases
create tape 20 allot \ 20 cell tape, can be changed.
variable writehead \ read/writehead position, 0-index.
create bstack 31 allot \ 2^5 - 1 maximum bracket indexing
variable fstart
variable flen
variable fptr
variable running

\ reset/qol words
: dstackall depth 0 do drop loop ;
: cleartape 20 0 do 0 i tape + ! loop ; \ unfortunately hardcoded
: ++ dup @ 1 + swap ! ;
: tah tape writehead @ + ; \ thing at head

\ file pointer setup
s" main.bf" slurp-file
flen ! \ file length
fstart ! \ file start pointer

\ indexing workaround
: findex  ( n -- c ) fstart @ + c@ ;
  \ n : index, c: character-at. 0 indexed

\  init/setup
cleartape
1 running !

\ ----- Body ----- \

\ 69 tape !  debug line

: handle ( n -- ) 
	\ 46 = if ( period ) tape writehead @ + c@ emit then
	43 = if ( plus ) tah c@ ." hhf" then
	
;

: run begin 
		running @ 1 =
	while
		fptr @ findex \ dup .
 		handle
		fptr @ 1 + fptr !

		fptr @ 100 = if running 0 ! then
 	repeat ;



run