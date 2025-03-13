;WAP in 8086 which will input the username from the keyboard. If the user is
;"Tribhuvan University" it will display "valid user" else it will display "invalid
;user".

.model small
.stack 64	; Allocates a 64-byte stack for the program. 
.data
 	MAXLEN DB 255         ; MAXIMUM BUFFER SIZE (255 CHARACTERS)  
	ACTLEN DB ?           ; ACTUAL LENGTH OF INPUT (FILLED AFTER INPUT)  
	INPUT DB 255 DUP('$') ; BUFFER TO STORE USER INPUT
	
	valid_prompt DB "Valid User$"
	invalid_prompt DB "Invalid User$"
	
	test_string DB "Tribhuvan University$"
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
        
        NEW_LINE
        MOV CL, ACTLEN
        CMP CL, 20d
        JZ CONTINUE
        
        MOV AH, 09h
        LEA DX, invalid_prompt
        int 21h
        ;end program
        mov ax, 4C00h	
        int 21h
        
        CONTINUE:
        
        MOV CH, 0
        MOV CL, ACTLEN
        LEA DI, test_string
        LEA SI, INPUT ; Skip first two bytes  
        
        L1:
        	MOV Al, [SI]
        	MOV BL, [DI]
        	CMP BL, AL
        	JE CORRECT
        		MOV AH, 09h
        		LEA DX, invalid_prompt
        		int 21h
        		;end program
        		mov ax, 4C00h	
        		int 21h   
        	CORRECT:
	        	INC SI
	        	INC DI
        	
        LOOP L1
        
        MOV AH, 09h
        LEA DX, valid_prompt
        int 21h
        
        mov ax, 4C00h	
        int 21h    
          
    main endp
      
 end