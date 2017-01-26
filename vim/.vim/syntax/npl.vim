" Vim syntax file
" Language   : NPL
" Maintainers: David Yach
" Last Change: 2013 Nov 20

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match
syn sync minlines=50

" most NPL keywords
syn keyword nplKeyword assert assertFail def else for if none on otherwise schema where
syn match nplKeyword "<-"

" package and import statements
syn keyword nplPackage package 
syn keyword nplImport import

" boolean literals
syn keyword nplBoolean true false

" comments
syn match nplLineComment "//.*"
syn region nplComment start="/\*" end="\*/"

" regions
syn region nplBraces start="{" end="}" fold transparent
syn region nplParens start="(" end=")" fold transparent
syn region nplBrackets start="\[" end="\]" fold transparent

syn match nplEmptyString "\"\""
syn match nplString "\"[^\"\n]*\""

" identifiers
syn match nplId "[_a-zA-Z][_a-zA-Z0-9]*"
syn match nplIdPrime "[_a-zA-Z][_a-zA-Z0-9]*'"

" number literals
syn match nplNumber "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match nplNumber "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match nplNumber "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match nplNumber "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

syn sync fromstart

" map npl groups to standard groups
hi link nplKeyword Keyword
hi link nplPackage Include
hi link nplFqnPrime Include
hi link nplFqn Identifier
hi link nplImport Include
hi link nplBoolean Boolean
hi link nplOperator Operator
hi link nplNumber Number
hi link nplEmptyString String
hi link nplString String
hi link nplComment Comment
hi link nplLineComment Comment
hi link nplId Identifier
hi link nplIdPrime Include
hi link nplDefName Function
hi link nplBraces Operator
hi link nplParens Operator
hi link nplBrackets Operator

let b:current_syntax = "npl"

" you might like to put these lines in your .vimrc
"
" customize colors a little bit (should be a different file)
" hi nplNew gui=underline
" hi nplMethodCall gui=italic
" hi nplValName gui=underline
" hi nplVarName gui=underline
