;write a program to reas a string from user and display vowels and consonants seperately

.model small
.stack 64
.data
    MAXLEN DB 255
    ACTLEN DB ?
    INPUT DB 255 DUP('$')   
    
    vowel db 255 DUP('$')
    cons db 255 DUP('$')
    
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
        
        lea si, input
        lea di, vowel
        lea bx, cons
        l1:
        	mov al, [si]
        	cmp al, 32
        	je skip
        	
        	cmp al, 'a'
        	je store_v
        	cmp al, 'e'
        	je store_v
        	cmp al, 'i'
        	je store_v
        	cmp al, 'o'
        	je store_v
        	cmp al, 'u'
        	je store_v
        	
        	mov [bx], al
        	inc bx
        	jmp skip
        	
        store_v:
        	mov [di], al
        	inc di
        
        	
        skip:
        	inc si
        	
        loop l1
        
        mov ah, 09h
        lea dx, vowel
        int 21h
        
        NEW_LINE
        mov ah, 09h
        lea dx, cons
        int 21h
        
        mov ah, 4Ch
        int 21h
        
        
        
     main endp
  
         
 end
