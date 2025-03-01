;write a program to read a string and display it in next line with first letter in uppercase and rest in lowercase for each word

.model small
.stack 64
.data
    MAXLEN DB 255
    ACTLEN DB ?
    INPUT DB 255 DUP('$')   
   
    
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
        
        mov ah, 0ah
        lea dx, MAXLEN
        int 21h
        
        NEW_LINE
        
        mov ch, 0
        mov cl, actlen
        
        mov bl, 1 ;flag
        lea si, input
        l1:
        	mov dl, [si]
        	mov ah, 02h
        	
        	cmp dl, 32
        	jne flag_not_set
        	mov bl, 1
        	jmp print
        	
        flag_not_set:
        	cmp bl, 1
        	jne print
        	sub dl, 32
        	mov bl, 0
        
        print:
        
        	int 21h
        	inc si
        	
        loop l1
        
        mov ah, 4Ch
        int 21h
        
        
        
     main endp
  
         
 end
