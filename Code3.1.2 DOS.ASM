.model small
.stack 64H
;ANISH DESAI
;20BCE0461
.code
start:
   mov ah,00H
   INT 16H
   cmp al,0
   jz exit
   mov ah,0EH
   INT 10H
   jmp start
   exit : INT 03H
END

