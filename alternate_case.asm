;WAP in 8086 to read word from user and display all the alphabets in alternate case
;(first alphabet in uppercase, second alphabet in lower case , third alphabet in
;upper case and so on) in clear screen.

.model small
.stack 64
.data
    MAXLEN DB 255
    ACTLEN DB ?
    INPUT DB 255 DUP('$')
    
    prompt db 'Enter a word: $'
   
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
        
        ;upper and lower count
        lea SI, INPUT
        
        MOV BL, 1	;uppercase flag
        
        l1:
        	mov al, [si]
        	cmp al, 'A'
        	JL print
        	cmp al, 'z'
        	JG print
        	cmp al, 'Z'
        	JG check_lower
        	cmp bl, 1
        	jz print
        	add al, 32
        	jmp print
        check_lower:
        	cmp al, 'a'
        	JL print
        	cmp bl, 0
        	jz print
        	sub al, 32
        print:
        	mov ah, 02h
        	mov dl, al
        	int 21h
    
        	cmp bl, 1	; uppercase flag toggle
        	jz skip
        	mov bl, 1
        	jmp skip2
        skip:	mov bl, 0
        skip2:	inc si
        
        loop l1
     	
        mov ah, 4Ch
        int 21h
     main endp    
end