.model small
.stack 100H
;ANISH DESAI
;20BCE0461
.code

mov ax,000DH
INT 10H

mov ax,0503H
INT 10H

mov ah,0CH
mov bh,03H
mov al,73H
mov cx,135
mov dx,100
mov bl,100
LINE : INT 10H
       INC CX
       DEC BL
       JNZ LINE

mov ah,02H
mov dl,20
mov dh,11
INT 10H

mov ah,0EH
mov bl,05H
mov al,'A'
INT 10H
INC dl

mov ah,0EH
mov bl,05H
mov al,'N'
INT 10H
INC dl

mov ah,0EH
mov bl,05H
mov al,'I'
INT 10H
INC dl

mov ah,0EH
mov bl,05H
mov al,'S'
INT 10H
INC dl

mov ah,0EH
mov bl,05H
mov al,'H'
INT 10H

mov ax,4C00H
INT 21H
END
