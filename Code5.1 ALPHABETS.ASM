.model small
.stack 100H
;ANISH DESAI
;20BCE0461

.code
    ;Display A-Z
    mov ah, 02H 
    mov dl, 'A' 
    mov cx, 26 

    display:
        INT 21H 
        INC dl
        LOOP display 

    ;Display Z-A
    mov dl, 'Z' 
    mov cx, 26 

    display_rev:
        INT 21H 
        DEC dl
        LOOP display_rev 

mov ax,4C00H 
INT 21H 
END
