;WAP in 8086 to read string from user and 
;display only alphabetic character from the string 
;in clear screen.

.model small
.stack 64
.data
    MAXLEN DB 255
    ACTLEN DB ?
    INPUT DB 255 DUP('$')
    
    prompt db 'Enter a string: $'
   
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
        
        ;clear screen
        MOV AX,0600H;REQ TO SCROLL
    	MOV BH,61H        ;BLUE ON BROWN FOR ATTRIBUT ON PIXEL 
    	MOV CX,0000H
    	MOV DX,1950H
    	INT 10h
    	;Cursor Reset
    	MOV AH, 02h      ; Function 02h: Set cursor position
    	MOV BH, 00h      ; Video page 0
    	MOV DX, 0000h    ; Row 0, column 0
        INT 10h
        
        ;loop counter
        mov ch, 0
        mov cl, actlen

        lea SI, INPUT
        
        l1:
        	mov al, [si]
        	cmp al, 'A'
        	JL skip
        	cmp al, 'z'
        	JG skip
        	cmp al, 'Z'
        	JG check_lower
        	jmp print
        check_lower:
        	cmp al, 'a'
        	JL skip
        print:
        	mov ah, 02h
        	mov dl, al
        	int 21h
        skip:
        	INC SI
        
        loop l1
     	
        mov ah, 4Ch
        int 21h
     main endp    
end