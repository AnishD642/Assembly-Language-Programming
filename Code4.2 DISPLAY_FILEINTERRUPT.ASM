.model small
.stack 100H
;ANISH DESAI
;20BCE0461
.data
   MSG DB 'ANISH DESAI: 20BCE0461$'
.code
   mov ax,@data
   mov ds,ax
   mov ah,40H
   mov bx,1
   mov cx,22
   lea dx,MSG
   INT 21H
mov ax,4C00H
INT 21H
END


