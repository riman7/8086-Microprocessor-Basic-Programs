;wap in 8086 microprocessor to Clear Screen

.model small
.stack 64
.data
    prompt db 'SCREEN CLEARED$'
.code
    main proc far 
        
        mov ax, @data
        mov ds, ax
        
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
	
	; Prompt
        mov ah, 09h
        lea dx, prompt
        int 21h
 	
 	;exist
        mov ah, 4Ch
        int 21h
     main endp
 end