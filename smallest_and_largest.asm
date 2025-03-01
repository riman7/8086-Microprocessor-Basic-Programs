;wap in 8086 to find the largest and smallest numbers of an array having 10 numbers.
;Display the found numbers in the clear screen

.model small
.stack 64
.data
    ARRAY db 0, 2, 3, 1, 5, 6, 7, 8, 9, 4
 
    smallest_msg db 'Smallest: $'
    largest_msg db 'Largest: $'
    
    ;upper and lower count  
    smallest DB ?
    largest DB ?
    
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

        ;loop counter
        mov ch, 0
        mov cl, 9
        
        ;pointers
        lea SI, ARRAY
        MOV AL, [SI]
        mov smallest, AL
        mov largest, AL 
      
        l1:
        	MOV AL, [SI]
        	cmp AL, smallest
        	jg skip1
        	mov smallest, AL
        skip1:
        	cmp AL, largest
        	jl skip2
        	mov largest, AL
        skip2:
        	inc si
        loop l1
        
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
        
        mov ah, 09h
        lea dx, smallest_msg
        int 21h
        mov ah, 02h
        mov dl, smallest
        add dl, 48
        int 21h

        NEW_LINE
                
        mov ah, 09h
        lea dx, largest_msg
        int 21h
        mov ah, 02h
        mov dl, largest
        add dl, 48
        int 21h
	
       
        mov ah, 4Ch
        int 21h
     main endp         
 end
