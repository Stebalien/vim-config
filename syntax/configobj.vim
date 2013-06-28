" Vim syntax file

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" shut case off
syn case ignore


syn region  configobjHeaderString  start=/'/ end=/'/ oneline contained
syn region  configobjHeaderString  start=/"/ end=/"/ oneline contained

syn region  configobjString  start=/"/ end=/"/ oneline contained
syn region  configobjString  start=/'''/ end=/'''/ contained
syn region  configobjString  start=/"""/ end=/"""/ contained

syn region  configobjHeader   start=/\s*\[*/ end=/\]*/ oneline 

syn match  configobjIdentifier /^\s*[^=]*/ nextgroup=configobjEquals skipwhite contained
syn match  configobjEquals  /=/ skipwhite contained nextgroup=configobjValue
syn match  configobjValue /.*/ skipwhite contained contains=configobjString


syn match  configobjAssignment "^.\{-}=.*" contains=configobjIdentifier

syn match  configobjComment  "#.*$"



" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_configobj_syntax_inits")
  if version < 508
    let did_configobj_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink configobjHeader   Special
  HiLink configobjHeaderInner   Special
  HiLink configobjComment  Comment
  HiLink configobjEquals Delimiter
  HiLink configobjValue String
  HiLink configobjString String
  HiLink configobjIdentifier Identifier

  delcommand HiLink
endif

let b:current_syntax = "configobj"

" vim: sts=2 sw=2 et
