" Vim syntax file
" Language:	    Intelib LISP
" Maintainer:   Nickolay Kudasov

syn match illAppend /||/
syn match illFunQuote /F\^/
syn match illQuotedSymbol /\~[a-zA-Z_][a-zA-Z0-9_]*\(([^)]*)\)*/
syn region illQuote start=+\~(+ end=+)+ contains=illNumber,justParens

syn match illNIL /(L)/

syn region justParens start=+[^\~]([^L]+ end=+)+

" String literals
syn match   illSpecialChar  contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syn region  illString       start=+"+  skip=+\\\\\|\\"+  end=+"+ contains=illSpecialChar

" Integer with - + or nothing in front
syn match illNumber '\d\+'
syn match illNumber '[-+]\d\+'

" Floating point number with decimal no E or e (+,-)
syn match illNumber '\d\+\.\d*'
syn match illNumber '[-+]\d\+\.\d*'

" Floating point like number with E and no decimal point (+,-)
syn match illNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match illNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like number with E and decimal point (+,-)
syn match illNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match illNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

" Standard function set
syn keyword illFunction     ABS APPEND AREF ATOM BREAK
syn keyword illFunction     CONS CONSP MINUS DIFFERENCE EQ EQL
syn keyword illFunction     EQUAL ERROR EVENP FUNCALL
syn keyword illFunction     ISQRT LAST LENGTH LIST LISTP
syn keyword illFunction     LREDUCE MAKEARRAY MATHEQUAL
syn keyword illFunction     MATHNOTEQUAL MATHGEQ MATHLEQ LESSP GREATERP
syn keyword illFunction     MEMBER MOD NOT NTH lNULL NUMBERP
syn keyword illFunction     ODDP PLUS QUOTIENT RANDOM REM
syn keyword illFunction     REMOVE REVERSE RPLACA RPLACD
syn keyword illFunction     RREDUCE SYMBOLFUNCTION SYMBOLP
syn keyword illFunction     SYMBOLVALUE TEXTREPRESENTATION
syn keyword illFunction     TIMES VERSIONINFO

" CARs and CDRs
syn keyword illFunction     CAR CDR
syn keyword illFunction     CAAR CADR CDAR CDDR
syn keyword illFunction     CAAAR CAADR CADAR CADDR
syn keyword illFunction     CDAAR CDADR CDDAR CDDDR
syn keyword illFunction     CAAAAR CAAADR CAADAR CAADDR
syn keyword illFunction     CADAAR CADADR CADDAR CADDDR
syn keyword illFunction     CDAAAR CDAADR CDADAR CDADDR
syn keyword illFunction     CDDAAR CDDADR CDDDAR CDDDDR

" Named selectors
syn keyword illFunction     FIRST SECOND THIRD FOURTH
syn keyword illFunction     FIFTH SIXTH SEVENTH EIGHTH
syn keyword illFunction     NINETH TENTH

" Hash table functions
syn keyword illFunction     CLRHASH GETHASH HASHTABLECOUNT
syn keyword illFunction     MAKEHASHTABLE MAKEHASHTABLE_EQ
syn keyword illFunction     MAKEHASHTABLE_EQL MAPHASH
syn keyword illFunction     REMHASH SXHASH

" Input/output functions
syn keyword illFunction     GETCURRENTLINE LFCLOSE LFGETC
syn keyword illFunction     LFGETS LFOPEN LFPUTC LFPUTS
syn keyword illFunction     LFREOPEN LFSEEK LFTELL LFUNGETC
syn keyword illFunction     PRINC TERPRI

" Mathematic functions
syn keyword illFunction     ACOS ASIN ATAN COS EXP EXPT
syn keyword illFunction     LOG SIN SQRT TAN

" XXX: God knows what!
syn keyword illFunction     CLASSICATOMNAME CLASSICATOMP
syn keyword illFunction     MAKECLASSICATOM IMPORT INTERN
syn keyword illFunction     SYMBOLNAME PRIN1 PRINT READ
syn keyword illFunction     READFROMSTRING SAFEREAD READERROR

" String functions
syn keyword illFunction     CHARACTERP CHAR LIST2STRING
syn keyword illFunction     STRING2C CHAR2C STRING2LIST
syn keyword illFunction     STRING2NUM STRINGLENGTH
syn keyword illFunction     STRINGP SUBSTRING TOUPPER
syn keyword illFunction     TOLOWER

" Standard special forms
syn keyword illSpecform     DEFMACRO DEFUN DEFVAR EVAL
syn keyword illSpecform     FLET LET SET SETF SETQ WHILE
syn keyword illSpecform     FLET LET SET SETF SETQ WHILE
syn keyword illSpecform     T NIL QUOTE FUNCTION LAMBDA
syn keyword illSpecform     COND IF AND OR PROGN MAPCAR APPLY SORT

if version >= 508
    "|| !exists("did_ill_syntax_inits")
  if version < 508
    let did_ill_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink illDelim           Comment
  HiLink illFunQuote        Special

  HiLink illNIL             Type
  HiLink illQuote           Type
  HiLink illQuotedSymbol    Type
  HiLink illAppend          Operator

  HiLink illFunction        Function
  HiLink illSpecform        PreProc

  HiLink illNumber          Constant
  HiLink illString          String

  delcommand HiLink
endif

