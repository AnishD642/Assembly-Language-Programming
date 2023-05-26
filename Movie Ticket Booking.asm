org 100h 

.model small 

.stack 100h

.data    


menu:   DB 0Dh,0Ah,0Dh,0Ah, "Main Menu : ",0Dh,0Ah
        DB 0Dh,0Ah, "|-----------------------------------------------------------|",0Dh,0Ah
        DB "| 1- ALL the names of the movie theaters and their locations|",0Dh,0Ah
        DB "| 2- Book a ticket                                          |", 0Dh,0Ah
        DB "| 3- Exit the application                                   |",0Dh, 0Ah
        DB "|-----------------------------------------------------------|",0Dh,0Ah   
        DB 0Dh,0Ah
        DB "Please select the option: ", '$'  

CRLF    db 13,10,'$'

totalbill: DB 0Dh,0Ah, "The total bill is:",'$'

theatres_info:      
        DB 0Dh,0Ah,0Dh,0Ah,"Theatre Details : ",0Dh,0Ah  
        DB 0Dh,0Ah,"SNo. Theatre name        Location          Telephone number      Working hours",0Dh,0Ah
        DB "1.   INOX Selvam         Tiruvalam Rd      0461-213546987         3pm to 12am ",0Dh,0Ah 
        DB "2.   PVR Cinemas         Gandhinagar       0461-215786987         1pm to 10pm ",0Dh,0Ah
        DB "3.   Sri Vishnu Show     Church Colony     0461-273646988         12pm to 12am ",0Dh,0Ah
        DB "4.   Galaxy Cinemas      Muthamizh Nagar   0461-25896987          3pm to 12am ",0Dh,0Ah
        DB "5.   Venus Theatres      Krishna Nagar     0461-27259698          12pm to 12am ",0Dh,0Ah, '$' 
        
 
adventure_theatre:                                              
        DB 0dh,0Ah,0Dh,0Ah,"Available Movies and Price List : ",0Dh,0Ah,0Dh,0Ah
        DB 0dh,0Ah,"1: Spiderman (Adventure)  3PM - 5PM",0Dh,0Ah
        DB 0dh,0Ah,"Ticket              Price",0Dh,0Ah   
        DB "Under 12 years old  100 Rs",0Dh,0Ah
        DB "Under 18 years old  150 Rs",0Dh,0Ah
        DB "Adults              125 Rs",0Dh,0Ah,'$'
        
comedy_theatre:
        DB "2: Golmaal (Comedy) 3:30PM - 6:30PM",0Dh,0Ah,
        DB "Ticket              Price",0Dh,0Ah   
        DB "Under 12 years old  85 Rs",0Dh,0Ah
        DB "Under 18 years old  135 Rs",0Dh,0Ah
        DB "Adults              115 Rs",0Dh,0Ah,'$'

action_theatre:
        DB "3: John Wick (Action) 5PM - 7:30PM",0Dh,0Ah,
        DB "Ticket              Price",0Dh,0Ah   
        DB "Under 18 years old  105 Rs",0Dh,0Ah
        DB "Seniors             135 Rs",0Dh,0Ah,'$'
        
thriller_theatre:
        DB "4: KGF (Thriller) 8PM - 11:30PM",0Dh,0Ah,
        DB "Ticket              Price",0Dh,0Ah   
        DB "Under 18 years old  160 Rs",0Dh,0Ah
        DB "Adults              135 Rs",0Dh,0Ah,'$'


horror_theatre:
        DB "5: 1920 (Horror) 9PM - 12AM",0Dh,0Ah,
        DB "Ticket              Price",0Dh,0Ah   
        DB "Under 18 years old  165 Rs",0Dh,0Ah
        DB "Adults              125 Rs",0Dh,0Ah,'$'
                  
                  
theatre_loc: DB 0Dh,0Ah,0Dh,0Ah,"Which theatre location do you want to choose? OR press E for Main Menu: ",'$'                                         
age_certified: DB 0Dh,0Ah, "Are there children below the age of 12? [Y/N] OR press E for Main Menu: ",'$'             
theatres:       DB 0Dh,0Ah,"What movie would you like to go to (1-Adventure , 2-Comedy, 3-Action, 4-Thriller, 5-Horror, E-Main Menu)? ",'$' 
theatres_c: DB 0Dh,0Ah,"What movie would you like to go to (1-Adventure , 2-Comedy, E-Main Menu>? ",'$'   
ticket: DB 0Dh,0Ah, "What ticket would you like to buy (1-Under 18 , 2-Adult, E-Main Menu>?",'$'
ticket_c:         DB 0Dh,0Ah, "What ticket would you like to buy (1-Under 12 , 2-Under 18 , 3-Adult, E-Main Menu>?",'$'
ticket_number:  DB 0Dh,0Ah, "How many tickets do you like to buy? or press E for Main Menu: ",'$'

child12_adventure     DD 100 ; child Price for adventure theater
child18_adventure     DD 150 ; adult Price for adventure theater
adult_adventure   DD 125 ;Seniors Price for adventure theater

child12_comedy     DD 85 ; child Price for comedy theater
child18_comedy     DD 135 ; adult Price for comedy theater
adult_comedy   DD 115 ;Seniors Price for comedy theater

child12_action     DD 105 ; child Price for action theater
child18_action     DD 150 ; adult Price for action theater
adult_action   DD 135 ;Seniors Price for action theater

child12_thriller     DD 110 ; child Price for thriller theater
child18_thriller      DD 160 ; adult Price for thriller theater
adult_thriller    DD 135 ;Seniors Price for thriller theater                         

child12_horror     DD 115 ; child Price for horror theater
child18_horror     DD 165 ; adult Price for horror theater
adult_horror   DD 125 ;Seniors Price for horror theater
          
theatre_location  DB 0          
theatre_type DB 0 
age_c        DB 0
ticket_type  DB 0
ticket_num   DD 0
ticket_price DD 0   
result       DD 0   

.code

begin:
       mov ax,@data
       mov ds,ax       
       
       MOV AH, 06h    ; Scroll up function
       XOR AL, AL     ; Clear entire screen
       XOR CX, CX     ; Upper left corner CH=row, CL=column
       MOV DX, 184FH  ; lower right corner DH=row, DL=column 
       MOV BH, 5Eh    ; YellowOnMagenta
       INT 10H
       
start:       

;To display menu
      mov dx,offset menu
      mov ah,09h
      int 21h            

;Choose choice        
get_choice:

        mov ah, 1
        int 21h
        
        ;first option
        cmp al, '1'
        je FIRST_CHOICE
        
        ;second option
        cmp al, '2'
        je SECOND_CHOICE
        
         ;third option
        cmp al, '3'
        je THIRD_CHOICE
        
        cmp al,'E'
        je start


        jmp get_choice  
        
;theatres info
FIRST_CHOICE:
        
        mov dx, offset theatres_info
        mov ah, 9
        int 21h
                 
        mov dx, offset CRLF
        mov ah, 9
        int 21h

        jmp start

;book ticket
SECOND_CHOICE:   
                      
        mov dx,offset CRLF
        mov ah,9
        mov dx,theatres_info
        mov ah,9
        int 21h             
        
        mov dx, offset CRLF
        mov ah,9
        mov dx,theatre_loc
        mov ah,9
        int 21h
        
        mov ah,1
        int 21h
        mov theatre_location, al
        
        cmp theatre_location,'E'
        je start
        
        mov dx, offset CRLF
        mov ah,9
        mov dx, offset age_certified 
        mov ah,9
        int 21h        
        
        ;Get Age Certification/Validity
        mov ah, 1
        int 21h
        mov age_c, al  
        
        cmp age_c,'E'
        je start

                              
        cmp age_c, 'Y'
        je SECOND_CHOICE_CHILDREN
        
        mov dx, offset CRLF
        mov ah, 9
        int 21h
        mov dx, offset adventure_theatre
        mov ah, 9
        int 21h 
        
        mov dx, offset CRLF
        mov ah, 9
        int 21h
        mov dx, offset comedy_theatre
        mov ah, 9
        int 21h 
        
         
        mov dx, offset CRLF
        mov ah, 9
        int 21h
        mov dx, offset action_theatre
        mov ah, 9
        int 21h 
                   
          
        mov dx, offset CRLF
        mov ah, 9
        int 21h
        mov dx, offset thriller_theatre
        mov ah, 9
        int 21h    
        
        mov dx, offset CRLF
        mov ah, 9
        int 21h
        mov dx, offset horror_theatre
        mov ah, 9
        int 21h    
             
             
        ;theatre type message
        mov dx,offset theatres
        mov ah,9
        int 21h 
             
        ;Get theatre type
        mov ah, 1
        int 21h
        mov theatre_type, al      
        
        cmp theatre_type,'E'
        je start
        
        ;ticket type message
        mov dx,offset ticket
        mov ah,9
        int 21h 
             
         
        ;Get ticket type
        mov ah, 1
        int 21h
        mov ticket_type, al  
        
        cmp ticket_type,'E'
        je start
        
        ;ticket number message
        mov dx,offset ticket_number
        mov ah,9
        int 21h 
             
         
        ;Get ticket number
        call INDEC
        mov ticket_num, ax    
        
        cmp ticket_num,'E'
        je start
        
        ; check the theaters type
        cmp theatre_type, '1'
        je adventure_cinema
        cmp theatre_type, '2'
        je comedy_cinema
        cmp theatre_type, '3'
        je action_cinema
        cmp theatre_type, '4'
        je thriller_cinema
        cmp theatre_type, '5'
        je horror_cinema  
        jmp SECOND_CHOICE    
        
        
        ; code for the film theaters //1-adventure
        adventure_cinema:      
            
            cmp ticket_type, '1'
            jne ADULT_ticket_adventure
            mov ax, child18_adventure
            mov ticket_price, ax
            jmp calculate

            ; seiners ticket
            ADULT_ticket_adventure:
            cmp ticket_type, '2'
            jne SECOND_CHOICE
            mov ax, adult_adventure
            mov ticket_price, ax
            jmp calculate    
            
         ;//2-comedy
         comedy_cinema:   
            cmp ticket_type, '1'
            jne ADULT_ticket_comedy
            mov ax, child18_comedy
            mov ticket_price, ax
            jmp calculate

            ; seiners ticket
            ADULT_ticket_comedy:
            cmp ticket_type, '2'
            jne SECOND_CHOICE
            mov ax, adult_comedy
            mov ticket_price, ax
            jmp calculate    


         ;//3-action   
         action_cinema:
            cmp ticket_type, '1'
            jne ADULT_ticket_action
            mov ax, child18_action
            mov ticket_price, ax
            jmp calculate

            ; seiners ticket
            ADULT_ticket_action:
            cmp ticket_type, '2'
            jne SECOND_CHOICE
            mov ax, adult_action
            mov ticket_price, ax
            jmp calculate    
                            
            
         ;//4-thriller   
         thriller_cinema:
            cmp ticket_type, '1'
            jne ADULT_ticket_thriller
            mov ax, child18_thriller
            mov ticket_price, ax
            jmp calculate

            ; seiners ticket
            ADULT_ticket_thriller:
            cmp ticket_type, '2'
            jne SECOND_CHOICE
            mov ax, adult_thriller
            mov ticket_price, ax
            jmp calculate    
                  
          ;//5-horror   
          horror_cinema:
            cmp ticket_type, '1'
            jne ADULT_ticket_horror
            mov ax, child18_horror
            mov ticket_price, ax
            jmp calculate

            ; seiners ticket
            ADULT_ticket_horror:
            cmp ticket_type, '2'
            jne SECOND_CHOICE
            mov ax, adult_horror
            mov ticket_price, ax
            jmp calculate    
                           
                           
            ;Calculate total price
            calculate:
                mov cx, ticket_num
                mov ax, ticket_price
                mul cx
                mov result, ax
                
             ;Display total bill
                mov dx, offset CRLF
                mov ah,9
                int 21h
                mov dx, offset totalbill
                mov ah, 9
                int 21h  
                mov ax, result
                call OUTDEC
               
                mov dx, offset CRLF
                mov ah,9
                int 21h
             
                jmp start    
                
                
                
SECOND_CHOICE_CHILDREN:
          
        mov dx, offset CRLF
        mov ah, 9
        int 21h
        mov dx, offset adventure_theatre
        mov ah, 9
        int 21h 
        
        mov dx, offset CRLF
        mov ah, 9
        int 21h
        mov dx, offset comedy_theatre
        mov ah, 9
        int 21h 
        
        ;theatre type message
        mov dx,offset theatres_c
        mov ah,9
        int 21h 
             
        ;Get theatre type
        mov ah, 1
        int 21h
        mov theatre_type, al   
        
        cmp theatre_type,'E'
        je start
        
        ;ticket type message
        mov dx,offset ticket_c
        mov ah,9
        int 21h 
             
         
        ;Get ticket type
        mov ah, 1
        int 21h
        mov ticket_type, al 
        
        cmp ticket_type,'E'
        je start
        
        ;ticket number message
        mov dx,offset ticket_number
        mov ah,9
        int 21h 
             
         
        ;Get ticket number
        call INDEC
        mov ticket_num, ax  
        
        cmp ticket_num,'E'
        je start
        
        ; check the theaters type
        cmp theatre_type, '1'
        je adventure_cinema_c
        cmp theatre_type, '2'
        je comedy_cinema_c
        jmp SECOND_CHOICE_CHILDREN
        
        
        ; code for the film theaters //1-adventure
        adventure_cinema_c:
            ; child ticket
            cmp ticket_type, '1'
            jne ticket_adventure_18
            mov ax, child12_adventure
            mov ticket_price, ax
            jmp calculate_c

            ; adult ticket
            ticket_adventure_18:
            cmp ticket_type, '2'
            jne ADULT_ticket_adventure_c
            mov ax, child18_adventure
            mov ticket_price, ax
            jmp calculate_c

            ; seiners ticket
            ADULT_ticket_adventure_c:
            cmp ticket_type, '3'
            jne SECOND_CHOICE_CHILDREN
            mov ax, adult_adventure
            mov ticket_price, ax
            jmp calculate_c    
            
         ;//2-comedy   
         comedy_cinema_c:
            ; child ticket
            cmp ticket_type, '1'
            jne ticket_comedy_18
            mov ax, child12_adventure
            mov ticket_price, ax
            jmp calculate_c

            ; adult ticket
            ticket_comedy_18:
            cmp ticket_type, '2'
            jne ADULT_ticket_comedy_c
            mov ax, child18_comedy
            mov ticket_price, ax
            jmp calculate_c

            ; seiners ticket
            ADULT_ticket_comedy_c:
            cmp ticket_type, '3'
            jne SECOND_CHOICE_CHILDREN
            mov ax, adult_comedy
            mov ticket_price, ax
            jmp calculate_c    


        ;Calculate total price
            calculate_c:
                mov cx, ticket_num
                mov ax, ticket_price
                mul cx
                mov result, ax
                
             ;Display total bill
                mov dx, offset CRLF
                mov ah,9
                int 21h
                mov dx, offset totalbill
                mov ah, 9
                int 21h  
                mov ax, result
                call OUTDEC
               
                mov dx, offset CRLF
                mov ah,9
                int 21h
             
                jmp start    
            
            
                
THIRD_CHOICE:
        mov ah,4ch
        int 21h
        
        INDEC PROC
         
      PUSH BX
      PUSH CX
      PUSH DX
      
      JMP @READ
      
      @SKIP_BACKSPACE:
      MOV AH, 2
      MOV DL, 20H
      INT 21H
      
      @READ:
      XOR BX, BX  
      XOR CX, CX 
      XOR DX, DX  
      
      MOV AH, 1
      INT 21H
      
      CMP AL, '-'
      JE @MINUS
      
      CMP AL, '+'
      JE @PLUS
      
      JMP @SKIP_INPUT
      
      @MINUS:
      MOV CH, 1
      INC CL
      JMP @INPUT
      
      @PLUS:
      MOV CH, 2
      INC CL 
      
      @INPUT:
      MOV AH, 1
      INT 21H
      
      @SKIP_INPUT:
      CMP AL, 0DH
      JE @END_INPUT
      
      CMP AL, 8H
      JNE @NOT_BACKSPACE
      
      CMP CH,0
      JNE @CHECK_REMOVE_MINUS
      
      CMP CL, 0
      JE @SKIP_BACKSPACE
      JMP @MOVE_BACK
      
      @CHECK_REMOVE_MINUS:
      CMP CH,1
      JNE @CHECK_REMOVE_PLUS
      CMP CL, 1
      JE @REMOVE_PLUS_MINUS
      
      @CHECK_REMOVE_PLUS:
      CMP CL,1
      JE @REMOVE_PLUS_MINUS
      JMP @MOVE_BACK
      
      @REMOVE_PLUS_MINUS:
      MOV AH, 2
      MOV DL, 20H
      INT 21H
      
      MOV DL, 8H
      INT 21H
      
      JMP @READ
      
      @MOVE_BACK:
      MOV AX, BX  
      MOV BX, 10
      DIV BX
      
      MOV BX, AX   
      
      MOV AH, 2
      MOV DL, 20H
      INT 21H
      
      MOV DL, 8H
      INT 21H
      
      XOR DX, DX
      DEC CL     
      JMP @INPUT
      
      @NOT_BACKSPACE:
      INC CL
      CMP AL, 30H
      JL @ERROR
      CMP AL, 39H
      JG @ERROR
      AND AX,000FH
      
      PUSH AX
      MOV AX,10
      MUL BX
      MOV BX,AX
      
      POP AX
      
      ADD BX,AX
      JS @ERROR
      JMP @INPUT
      
      @ERROR:
      MOV AH, 2
      MOV DL, 7H
      INT 21H
      
      XOR CH, CH
      
      @CLEAR: 
      MOV DL, 8H
      INT 21H
      MOV DL, 20H
      INT 21H 
      MOV DL, 8H
      INT 21H
      LOOP @CLEAR
      
      JMP @READ
      
      @END_INPUT:
      CMP CH,1
      JNE @EXIT
      NEG BX
                  
      @EXIT:
      MOV AX, BX
      POP DX 
      POP CX
      POP DX  
      
      RET 
      INDEC ENDP 
       
      OUTDEC PROC
        PUSH BX
        PUSH CX
        PUSH DX
      
      CMP AX, 0
      JGE @START
      
      PUSH AX
      
      MOV AH, 2
      MOV DL, '-'
      INT 21H
      POP AX
      NEG AX    
      
      
      @START:
      XOR CX, CX
      MOV BX, 10
      
      @OUTPUT:
      XOR DX, DX
      DIV BX
      PUSH DX
      INC CX
      OR AX, AX
      JNE @OUTPUT
      
      MOV AH, 2
      
      @DISPLAY:
      POP DX
      OR DL, 30H
      INT 21H 
      LOOP @DISPLAY
          
      POP DX
      POP CX
      POP BX
      RET
     OUTDEC ENDP
 HLT