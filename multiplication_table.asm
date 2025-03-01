;wap in 8086 microprocessor to display multiplication table of the number given by user in clear screen

.model small
.stack 64
.data
    num db 0
    sum db 0
    
    prompt db 'Enter a number (0-9): $'
    ;upper and lower count  
    
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
        
        ;character input
        mov ah, 01
        int 21h ; stores input character in al
        sub al, 48
        mov num, al
        
        ;clear screen
        MOV AX,0600H;REQ TO SCROLL
	MOV BH,61H;BLUE ON BROWN FOR ATTRIBUT ON PIXEL 
	MOV CX,0000H
	MOV DX,1950H
	INT 10h
	;Cursor Reset
	MOV AH, 02h      ; Function 02h: Set cursor position
	MOV BH, 00h      ; Video page 0
	MOV DX, 0000h    ; Row 0, column 0
	INT 10h
	
	;MOV AH, 02h
	;MOV DX, 000Dh
	;INT 21h
 	
        
        mov ch, 0
        mov cl, 10
        
        l1:
        	push CX
        	mov ah, 0
        	mov al, sum
        	add al, num
        	mov sum, al
        	call print_number
        	NEW_LINE
        	pop CX
        loop l1
        
        mov ah, 4Ch
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