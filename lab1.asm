;Assembly level Program to toggle case in 8086

.model small
.stack 64   
.data
.code
    main proc far 
        
        mov ax, @data
        mov ds, ax
            
        mov ah, 01h
        int 21h
        mov bl, al
        
        cmp bl,90
        JB lower
        sub bl,32
        jmp exit
        
        lower:  
            add bl, 32
        
        exit:     
            mov ah, 02h
            mov dl, 0ah
            int 21h 
                
            mov dl, 0dh
            int 21h  
                  
            mov dl, bl
            int 21h
                
                
            mov ax, 4C00h
            int 21h    
            
    main endp 
end


