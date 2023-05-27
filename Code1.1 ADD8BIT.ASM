code segment
assume cs:code
;ANISH DESAI
;20BCE0461
start:
        mov ah, 0000h
        mov si, 3000h
        mov al, [si]
        inc si
        mov bl, [si]
        add al, bl
        inc si
        mov [si], al
        jc l1
        inc si
        mov [si], ah
        int 3h
        l1:
                inc ah
                inc si
                mov [si], ah
                int 3
code ends
end start
