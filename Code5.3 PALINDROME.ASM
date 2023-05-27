.model small
.stack 100H

;ANISH DESAI
;20BCE0461
                     
.data              
    display1 DB 'Original string: ','$'
    display2 DB ' Reversed string: ','$'
    message1 DB ' String is palindrome','$'
    message2 DB ' String is not palindrome','$'
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
    lea dx,display1
    INT 21H
    
    mov ah,09H
    lea dx,str
    INT 21H
    
    mov ah,09H
    lea dx,display2
    INT 21H
    
    mov ah,09H
    lea dx,strrev
    INT 21H     
    
    xor cx,cx   
    xor ax,ax
    xor bx,bx
    
    lea si,str
    lea di,strrev
    
    CHECK:
        mov al,[si]
        mov bl,[di]
        cmp al,bl
        jne NPAL
        loop CHECK
        
    PAL:
        mov ah,09H
        lea dx,message1
        INT 21H 
        jmp EXIT
        
    NPAL:
        mov ah,09H
        lea dx,message2
        INT 21H
    
    EXIT:
        mov ax,4C00H
        INT 21H
END
