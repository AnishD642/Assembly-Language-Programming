.model small
.stack 100H
;ANISH DESAI
;20BCE0461
.data
.code
   mov ax,0002H
   INT 10H

   mov ah,02H
   mov dh,12
   mov dl,36
   mov bh,02H
   INT 10H

   mov ax,0502H
   INT 10H

   mov ah,09H
   mov bl,05H
   mov bh,02H
   mov cx,0001H
   mov al,'2'
   INT 10H

   mov ah,02H
   mov dl,37
   INT 10H
   mov ah,09H
   mov al,'0'
   INT 10H

   mov ah,02H
   mov dl,38
   INT 10H
   mov ah,09H
   mov al,'B'
   INT 10H

   mov ah,02H
   mov dl,39
   INT 10H
   mov ah,09H
   mov al,'C'
   INT 10H

   mov ah,02H
   mov dl,40
   INT 10H
   mov ah,09H
   mov al,'E'
   INT 10H

   mov ah,02H
   mov dl,41
   INT 10H
   mov ah,09H
   mov al,'0'
   INT 10H

   mov ah,02H
   mov dl,42
   INT 10H
   mov ah,09H
   mov al,'4'
   INT 10H

   mov ah,02H
   mov dl,43
   INT 10H
   mov ah,09H
   mov al,'6'
   INT 10H

   mov ah,02H
   mov dl,44
   INT 10H
   mov ah,09H
   mov al,'1'
   INT 10H

mov ax,4C00H
INT 21H
END
