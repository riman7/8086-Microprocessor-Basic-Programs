;WAP in 8086 to input a string, count the word of this string whose length is greater than 5
;and display this count in clear screen.

.model small
.stack 64	; Allocates a 64-byte stack for the program. 
.data
 	MAXLEN DB 255         ; MAXIMUM BUFFER SIZE (255 CHARACTERS)  
	ACTLEN DB ?           ; ACTUAL LENGTH OF INPUT (FILLED AFTER INPUT)  
	INPUT DB 255 DUP('$') ; BUFFER TO STORE USER INPUT
	
	NEW_LINE MACRO
	        mov ah, 02h
	        mov dl, 0ah
	        int 21h 
	                
	        mov dl, 0dh
	        int 21h        
    	NEW_LINE ENDM 

.code
    main proc far 
        
        MOV ax, @data
        MOV ds, ax
        
        MOV ah, 0ah
        LEA DX, MAXLEN
        INT 21h
        
        NEW_lINE
        
        MOV CH, 0
        MOV CL, ACTLEN
        MOV BX, 0	;word count and letter count
        
        L1:
        	MOV Al, [SI]
        	CMP AL, 32
        	JZ SPACE
        		INC BH	; letter count
        		JMP SKIP
        	
        	SPACE:
        		CMP BH, 05H
        		MOV BH, 0
        		JNG SKIP
        		INC BL	;word count
        		
        	SKIP:
        	INC SI
        	
        LOOP L1
        
        MOV AH,0
        MOV AL, BL
        call print_number
        
        mov ax, 4C00h	
        int 21h    

      
            
    main endp
    
    print_number proc ;prints multiple digit number whose hex value is stored in AX register
	        cmp ax, 0
	        jne not_zero
	        mov dl, '0'
		mov ah, 02h
		int 21h
		ret
		
		not_zero:
			mov cx, 0; count no of digit (for print loop)
		
		loop_push:
			mov dx, 0 ; reset dl
			mov bx, 10
			div bx ;ax/bx, quotient ax, reminder dx
			add dl, '0'
			push dx
			inc cx
			cmp ax, 0
			jne loop_push
		
		; Print digits
		loop_print:
			pop dx
			mov ah, 02h
			int 21h
			loop loop_print
		ret
	print_number endp
      
 end