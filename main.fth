create tape 20 allot \ 20 cell tape, can be changed.
variable writehead \ read/writehead position, 0-index.
create bstack 31 allot \ 2^5 - 1 maximum bracket indexing
variable fstart
variable flen

: dstackall depth 0 do drop loop ;

: readfile ( fn -- flen, faddr) slurp-file ; 
\ fn is the name of the file. flen is file length, and faddr is the file address
: loopthrough ( v:o, s -- ) 0 do dup i + c@ . loop ;

s" main.bf" readfile

flen !
fstart ! .s