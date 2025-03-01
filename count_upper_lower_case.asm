;wap in 8086 microprocessor to read string and count no of uppercase and lowercase

.model small
.stack 64
.data
    MAXLEN DB 255
    ACTLEN DB ?
    INPUT DB 255 DUP('$')
    
    prompt db 'Enter a string: $'
    upper_msg db 'Uppercase: $'
    lower_msg db 'Lowercase: $'
    
    ;upper and lower count  
    UPPER DW 0
    LOWER DW 0 
   
    
    NEW_LINE MACRO
        mov ah, 02h
        mov dl, 0ah
        int 21h 
                
        mov dl, 0dh
        int 21h      
        
    NEW_LINE ENDM 
.code
    main proc far 
        
        mov ax, @data
        mov ds, ax
        
        ; Prompt user
        mov ah, 09h
        lea dx, prompt
        int 21h
        
        ;string input
        mov ah, 0ah
        lea dx, MAXLEN
        int 21h
        
        NEW_LINE
        
        ;loop counter
        mov ch, 0
        mov cl, actlen
        
        ;upper and lower count
        lea SI, INPUT
        
        l1:
        	mov al, [si]
        	cmp al, 'A'
        	JL other
        	cmp al, 'z'
        	JG other
        	cmp al, 'Z'
        	JG check_lower
        	inc UPPER
        check_lower:
        	cmp al, 'a'
        	JL other
        	inc LOWER
        other:
        	inc si
        loop l1
        
        NEW_LINE	
        
        mov ah, 09h
        lea dx, upper_msg
        int 21h
        mov ax, UPPER
        call print_number
        
        NEW_LINE
        
        mov ah, 09h
        lea dx, lower_msg
        int 21h
        mov ax, LOWER
        call print_number 
     	
        mov ah, 4Ch
        int 21h
     main endp
     
     print_number proc
	        cmp ax, 0
	        jne not_zero
	        mov dl, '0'
		mov ah, 02h
		int 21h
		ret
		
		not_zero:
			mov cx, 0; count no of digit (for print loop)
		
		loop_push:
			mov dx, 0
			mov bx, 10
			div bx ;quotient ax, reminder dx
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