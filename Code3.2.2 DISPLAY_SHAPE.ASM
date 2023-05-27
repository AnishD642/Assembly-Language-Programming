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
mov al,03H
mov bh,03H
mov cx,160
mov dx,75
mov bl,50
LINE1 : INT 10H
        DEC CX
        INC DX
        DEC BL
        JNZ LINE1

mov ah,0CH
mov al,03H
mov bh,03H
mov cx,160
mov dx,75
mov bl,50
LINE2 : INT 10H
        INC CX
        INC DX
        DEC BL
        JNZ LINE2

mov ah,0CH
mov al,03H
mov bh,03H
mov cx,110
mov dx,125
mov bl,100
LINE3 : INT 10H
        INC CX
        DEC BL
        JNZ LINE3

mov ax,4C00H
INT 21H
END
