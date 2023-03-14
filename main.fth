create fullfile 300000 allot \ the WHOLE file, max 3mb
                               \ tri-null terminated (probably)
create tape 20 allot \ 20 cell tape, can be changed.
variable writehead \ read/writehead position, 0-index.
create bstack 31 allot \ 2^5 - 1 maximum bracket indexing

: readfile ( fn -- flen, faddr) slurp-file 0 do dup i + c@ 2dup emit i fullfile ! loop ;
\ fn is the name of the file. flen is file length, and faddr is the file address

s" main.bf" readfile

2 fullfile @ .s
