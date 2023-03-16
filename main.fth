create tape 20 allot \ 20 cell tape, can be changed.
variable writehead \ read/writehead position, 0-index.
create bstack 31 allot \ 2^5 - 1 maximum bracket indexing
variable fstart
variable flen

: dstackall depth 0 do drop loop ;

\ fn is the name of the file. flen is file length, and faddr is the file address

s" main.bf" slurp-file

flen !
fstart !

: charinf flen @ 0 do fstart @ flen @ + i - c@ loop ;

charinf
