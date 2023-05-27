code segment
assume cs:code
;ANISH DESAI
;20BCE0461
start:
mov ax,0000H
mov si,3000H
mov al,[si]

mov bl,al
neg bl

mov cl,al
not cl
inc cl

mov dh,al
mov dl,00H
sub dl,dh
xor dh,dh

int 3H
code ends
end start
