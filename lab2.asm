.model small
.stack 64
.data
	MAXLEN DB 255
	ACTLEN DB ?
	INPUT DB 255 DUP('$')
	NEW_LINE MACRO
	MOV AH, 02H
	MOV DL, 0AH
	INT 21H
	MOV DL,0DH
	INT 21H
	NEW_LINE ENDM
.code
	main proc far
	 mov ax, @data
	 mov ds, ax
	 mov ah, 0ah
	 lea dx, MAXLEN
	int 21h
	CALL SCR_CLEAR
	NEW_LINE
	MOV CX,0000H
	MOV CL, ACTLEN
	LEA SI, INPUT
	L1: MOV AL,[SI]
	cmp al, 32
	je skip
	SUB AL, 32
	
	skip: mov dl,al
	
	MOV AH, 02H
	
	INT 21H 
	NEW_LINE
	INC SI
	LOOP L1
	
	mov ax, 4C00h
        int 21h    
	

main endp
SCR_CLEAR PROC NEAR
MOV AX,0600H;REQ TO SCROLL
MOV BH,61H;BLUE ON BROWN FOR ATTRIBUT ON PIXEL 
MOV CX,0000H
MOV DX,1950H
RET
SCR_CLEAR ENDP
end