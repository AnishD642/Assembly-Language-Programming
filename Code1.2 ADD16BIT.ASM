code segment
assume cs: code
;ANISH DESAI
;20BCE0461
start:
        mov ax,0000h
        mov bx,ax
        mov dx,ax
        mov si,3000h
        mov ax, [si]
        inc si
        inc si
        mov bx, [si]
        inc si
        inc si
        add ax,bx
        mov [si],ax
        jc l1
        inc si
        inc si
        mov [si], dx
        int 3
        l1:
                inc dx
                inc si
                inc si
                mov [si],dx
                int 3
        code ends
        end start
