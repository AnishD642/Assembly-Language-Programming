.model small
.stack 100h

;ANISH DESAI
;20BCE0461

.data
    array db 18, 20, 31, 24, 10, 19
    arr_length dw 6
    pushed db 0

.code
start:
    mov ax,@data
    mov ds,ax
    mov si,0
    mov al,array[si]
    mov ah,00H

    minloop:
           inc si
	   cmp si,arr_length
	   jge endloop
	   cmp al,array[si]
	   jg newmin
	   jmp minloop

    endloop:
	   mov bx,10
	   mov cx,0

    divloop:
        div bx
        push dx
        inc pushed
        cmp ax,10
        jge divloop
        push ax
        inc pushed

    showloop:
        pop dx
        add dl,30H
        mov ah,02H
        INT 21H
        dec pushed
        jnz showloop

    finish:
        INT 03H
        mov ax,4C00H
        INT 21H

    newmin:
        mov al,array[si]
        jmp minloop

END
