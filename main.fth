\ define bases
create tape 20 allot \ 20 cell tape, can be changed.
variable writehead \ read/writehead position, 0-index.
create bstack 31 allot \ 2^5 - 1 maximum bracket indexing
variable fstart
variable flen

\ reset words
: dstackall depth 0 do drop loop ;
: cleartape 20 0 do 0 i tape + ! loop ; \ unfortunately hardcoded

\ file pointer setup
s" main.bf" slurp-file
flen ! \ file length
fstart ! \ file start pointer

\ indexing workaround
: findex  ( n -- c ) fstart @ + c@ ;
  \ n : index, c: character-at. 0 indexed

\  init/setup
cleartape


\ ----- Body ----- \
