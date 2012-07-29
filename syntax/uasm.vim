
if exists("b:current_syntax")
    finish
endif

syn keyword uasmOp ADD ADDC SUB SUBC DIV DIVC MUL MULC
syn keyword uasmOp AND ANDC OR ORC XOR XORC XNOR XNORC
syn keyword uasmOp BEQ BNE JMP BF BT BR
syn keyword uasmOp CMPEQ CMPEQC CMPLE CMPLEC CMPLT CMPLTC
syn keyword uasmOp LD LDR ST MOVE CMOVE
syn keyword uasmOp PUSH POP ALLOCATE DEALLOCATE
syn keyword uasmOp SHL SHLC SHR SHRC SRA SRAC
syn keyword uasmOp RTN

syn keyword uasmReg LP BP SP PC XP
syn keyword uasmReg R0 R1 R2 R3 R4 R5 R6 R7 R8 R9 R10 R11 R12 R13 R14 R15 R16 R17 R18 R19 R20 R21 R22 R23 R24 R25 R26 R27 R28 R29 R30 R31 R31

syn match uasmNumber "\.\?\d\+"
syn match uasmNumber "\d\+\.\d*"

syn match uasmNumber "0x\x\+"
syn match uasmNumber "0b[01]\+"

syn region uasmString start='"' end='"'

syn match uasmInclude "^.include .*$"
syn match uasmMacro "^.macro"
syn match uasmAlign "^.align"
syn match uasmBreak "^.breakpoint"
syn match uasmProtect "^.protect"
syn match uasmText "^.text"
syn match uasmAscii "^.ascii"

syn keyword uasmType SEXT LONG

syn match uasmLabel "^\s*[[:alnum:]_]\+:"

syn keyword uasmTodo contained TODO FIXME XXX NOTE
syn match uasmComment "|.*$" contains=uasmTodo

let b:current_syntax = "uasm"

hi def link uasmOp Function 
hi def link uasmComment Comment 
hi def link uasmTodo Todo 
hi def link uasmReg Special

hi def link uasmNumber Number

hi def link uasmInclude PreProc
hi def link uasmMacro PreProc
hi def link uasmAlign PreProc
hi def link uasmBreak PreProc
hi def link uasmProtect PreProc
hi def link uasmText PreProc
hi def link uasmAscii PreProc

hi def link uasmType Type

hi def link uasmLabel Label

hi def link uasmString String
