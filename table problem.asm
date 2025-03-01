;Two tables contain 10 16-bit data.
;WAP in 8086 to generate third table 
;which contains 1FFFh if the corresponding data in 1st table is less than that of 2nd table,
;else store 0000h

.model small
.stack 64
.data
    ; First table with 10 16-bit values
    table1 dw 1000h, 2000h, 3000h, 4000h, 5000h, 6000h, 7000h, 8000h, 9000h, 0A000h

    ; Second table with 10 16-bit values
    table2 dw 1500h, 1500h, 3500h, 3800h, 4500h, 6500h, 6800h, 7800h, 8800h, 0B000h

    ; Third table to store results (10 16-bit values, initialized to 0)
    table3 dw 10 dup(0)

.code
    main proc far 
        
        ;data segment
        mov ax, @data
        mov ds, ax
        
        ;pointers
        lea SI, table1
        lea BX, table2
        lea DI, table3
        
        ;loop counter
        mov ch, 0
        mov cl, 10
        
        l1:
        	MOV AX, [SI]
        	cmp AX, [BX]
        	JG T1_GREATER
        	MOV [DI], 1FFFH
        	JMP SKIP
        T1_GREATER:
        	MOV [DI], 0000H	
        SKIP:
		add si, 2
		add bx, 2
		add di, 2
        LOOP L1
 
        

     	
        mov ah, 4Ch
        int 21h
     main endp   
         
 end