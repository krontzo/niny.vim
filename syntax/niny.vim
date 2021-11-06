" Vim syntax file
" Language: Niny Stack-oriented programming language
" Maintainer: krontzo
" Latest Revision: 22 October 2021

if exists("b:current_syntax")
  finish
endif

" Keyword
"full|push|dump|dup|pop|swp|change|rev|len|memory|add|sub|mult|div|pow|root|divmod|if|or|and|not|type|int|bool|float|string|list|append|insert|id|flat|inp|get
syn keyword ninyBuiltin full push dup pop swp change
syn keyword ninyBuiltin rev len add sub mult div pow
syn keyword ninyBuiltin root divmod type
syn keyword ninyType int bool float string list
syn keyword ninyBuiltin append insert id flat inp get
syn keyword ninyKeyword end break
syn keyword ninyDo do nextgroup=ninyMacro skipwhite
syn keyword ninyStatement macro nextgroup=ninyMacro skipwhite
syn keyword ninyFunction push nextgroup=ninyNumber,ninyFloat,ninyString skipwhite
syn keyword ninyFunction dump nextgroup=ninyNumber,ninyFloat,ninyString skipwhite
syn keyword ninyFunction memory nextgroup=ninyMacro skipwhite
syn keyword ninyInclude include
syn keyword ninyOperator or and not del
syn match ninyOperator "\(\(>\|<\)=\=\|==\|/=\|=\)"
syn keyword ninyConditional else if nextgroup=ninyDo skipwhite

" int, float, string
" Regular int like number with - + or nothing in front
syn match ninyNumber '\d\+' contained display
syn match ninyNumber '[-+]\d\+' contained display
" Floating point number with decimal no E or e (+,-)
syn match ninyFloat '\d\+\.\d*' contained display
syn match ninyFloat '[-+]\d\+\.\d*' contained display
syn region ninyString start='"' end='"' contained contains=ninyEscape,@Spell
syn match ninyEscape +\\[nrtv]+ contained

syn region ninyList start='\[' end='\]' contains=ninyNumber,ninyFloat,ninyString,ninyList
syn region ninyBlock start='do' end='end' fold transparent
    \ contains=ninyFunction,ninyStatement,ninyBuiltIn,ninyConditional,ninyOperator,ninyKeyword
syn keyword ninyTodo contained TODO FIXME NOTE XXX
syn match ninyComment "\$.*$" contains=ninyTodo,@Spell
syn match ninyFunction "\h\w*" display contained
syn match ninyMacro "\h\w*" display contained
syn sync match ninySync grouphere NONE "^\%(macro\|macro\)\s\+\h\w*\s*do"
let b:current_syntax = "niny"

hi def link ninyTodo          Todo
hi def link ninyComment       Comment
hi def link ninyStatement     Statement
hi def link ninyNumber        Constant
hi def link ninyFloat         Constant
hi def link ninyString        Constant
hi def link ninyBuiltin       Function
hi def link ninyFunction      Function
hi def link ninyConditional   Conditional
hi def link ninyOperator      Operator
hi def link ninyInclude       Include
hi def link ninyKeyword       Keyword
hi def link ninyDo            Keyword
hi def link ninyMacro         Type
hi def link ninyEscape        Type
hi def link ninyType          Type
