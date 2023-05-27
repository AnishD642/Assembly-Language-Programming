.model small
.stack 100H
;ANISH DESAI
;20BCE0461
.data
   MSG DB 'ANISH DESAI: 20BCE0461'
   LEN EQU $ - MSG
.code
start:
   mov ax,@data
   mov es,ax
   mov al,1
   mov bh,0
   mov bl,00111011B
   mov cx,LEN
   mov dl,10
   mov dh,7
   lea bp,MSG
   mov ah,13h
   INT 10H
mov ax,4C00H
INT 21H
END START
END
