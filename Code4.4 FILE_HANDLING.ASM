.model small
.stack 100H
;ANISH DESAI
;20BCE0461
.data
   FNAME DB 'HFL0461.try'
   HANDLE DW ?
   MSG DB 'Hello World! Anish Desai'
.code
   mov ax,@data
   mov ds,ax
   mov ah,3CH
   lea dx,FNAME
   mov cl,1
   INT 21H
   mov HANDLE,ax

   mov ah,40H
   mov bx,HANDLE
   mov cx,24
   lea dx,MSG
   INT 21H

   mov ah,3EH
   mov bx,HANDLE
   INT 21H

mov ax,4C00H
INT 21H
END
