.model small
.stack 64H
;ANISH DESAI
;20BCE0461
.code
start:
   mov ah,07H
   INT 21H
   cmp al,0
   jz exit
   mov dl,al
   mov ah,02H
   INT 21H
   jmp start
   exit : mov ax,4C00H
          INT 21H
END

