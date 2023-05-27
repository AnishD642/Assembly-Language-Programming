.model small
.stack 100H

;ANISH DESAI
;20BCE0461

.data
    str DB 'ANISH','$'
    strlen DW $-str
    strrev DB 20 DUP(0)
    
.code
start:
    mov ax,@data
    mov ds,ax
    
    mov cx,strlen
    add cx,-2
    lea si,str
    lea di,strrev
    add si,strlen
    add si,-2
    
    L1: mov al,[si]
        mov [di],al
        dec si
        inc di
        loop L1
        
    mov al,[si]
    mov [di],al
    inc di
    mov dl,'$'
    mov [di],dl
    
    mov ah,09H
    lea dx,strrev
    INT 21H
    
    mov ax,4C00H
    INT 21H
END
