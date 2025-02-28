;Assembly level Program to change into uppercase and print each character in newline in 8086

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
        
        MOV ax, @data
        MOV ds, ax
        
     
        MOV AH, 0AH
        LEA DX, MAXLEN
        INT 21H 
        
        ;CALL SCR_CLEAR 
        
        
        NEW_LINE
        MOV CX, 0000H  
        MOV CL, ACTLEN
        
        MOV BL, 01H; WORD COUNT
        L1:        
            MOV AL,[SI]
            CMP AL, 32;SPACE
            JNZ SKIP_COUNT
            INC BX
            
            SKIP_COUNT:
            INC SI
            
            
        
        LOOP L1  
                 
        ADD BL, 48         
        MOV DL, BL        
        MOV AH, 02h; FOR DISPLAY
        INT 21H  
        NEW_LINE
        
        mov ax, 4C00h
        int 21h    

      
            
    main endp
  
         
 end


