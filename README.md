# 8086 Microprocessor Basic Programs

This repository contains basic assembly language programs for the 8086 microprocessor. These programs cover various fundamental operations and problem-solving techniques useful for learning and understanding 8086 assembly programming.

---

## 📂 List of Programs  
These are the solved problems of the 8086 microprocessor asked in the IOE examination.

| S.N.  | Problem Statement | File Link |
|----|------------------|-----------|
| 1  | Assembly level Program to toggle case in 8086 | [click_here](toggle_case.asm) |
| 2  | Assembly level Program to change into uppercase and print each character in newline in clear screen in 8086| [click_here](each_letter_newline.asm) |  
| 3  | Assembly level Program in 8086 to Clear Screen| [click_here](clear_screen.asm) |  
| 4  | Assembly level Program in 8086 microprocessor to read a string and count no of uppercase and lowercase| [click_here](count_upper_lower_case.asm) |  
| 5  | Write an Assembly level Program in 8086 Microprocessor to read a string and display it in the next line with the first letter in uppercase and rest in lowercase for each word| [click_here](first_letter_uppercase.asm) |  
| 6  | Write an Assembly level Program in 8086 Microprocessor to display the multiplication table of the number given by the user in clear screen| [click_here](multiplication_table.asm) |  
| 7  | Write an Assembly level Program in 8086 Microprocessor to read string and count the number of words| [click_here](no_of_word.asm) |  
| 8  | Write an Assembly level Program in 8086 Microprocessor to find the largest and smallest numbers of an array having 10 numbers. Display the found numbers in the clear screen| [click_here](smallest_and_largest.asm) | 
| 9  | Two tables contain 10 16-bit data. WAP in 8086 to generate third table which contains 1FFFh if the corresponding data in 1st table is less than that of 2nd table, else store 0000h| [click_here](table_problem.asm) |  
| 10 | Assembly level Program in 8086 Microprocessor to read a string from user and display vowels and consonants seperately| [click_here](vowel_and_cons.asm) |  
| 11 | WAP in 8086 to read word from user and display all the alphabets in alternate case (first alphabet in uppercase, second alphabet in lower case , third alphabet in upper case and so on) in clear screen.| [click_here](alternate_case.asm) |  
| 12 | WAP in 8086 to read string from user and  display only alphabetic characters from the string in clear screen.| [click_here](print_only_alphabet.asm) |  
| 13 | WAP in 8086 which will input the username from the keyboard. If the user is "Tribhuvan University" it will display "valid user" else it will display "invalid user".| [click_here](valid_user.asm) |  
| 14 | WAP in 8086 to input a string, count the word of this string whose length is greater than 5 and display this count in clear screen.| [click_here](word_with_len_5.asm) |  

---

## Basic Templetes
This is the basic templete that almost every 8086 microprocessor program must have.
```assembly
.model small	; Defines the memory model. "small" means code and data fit within 64KB each.
.stack 64	; Allocates a 64-byte stack for the program. 
.data		; Section for declaring variables (if needed).

.code		;code section
    main proc far 
        
        MOV ax, @data
        MOV ds, ax	; Initializes the data segment (only needed if data section exists).

        ;your code here...
     
        mov ax, 4C00h	; DOS interrupt to return control to the OS.
        int 21h    
    main endp
 end
```

### Loop

```Assembly

MOV CX, 0
MOV CL, 05h  ;no of times loop runs 
L1:
 
     ;code here...
     INC SI  ;only if SI is used in loop(used in most cases)

LOOP L1
            
```

### New Line
```Assembly
MOV AH, 02H        ; SELECT DOS FUNCTION 02H (DISPLAY CHARACTER)
MOV DL, 0AH        ; ASCII CODE FOR LINE FEED.
INT 21H            ; CALL DOS INTERRUPT TO PRINT THE CHARACTER

MOV DL, 0DH        ; ASCII CODE FOR CARRIAGE RETURN (CR - MOVE TO BEGINNING OF LINE)
INT 21H            ; CALL DOS INTERRUPT TO PRINT THE CHARACTER    
```

### String
```Assembly
.DATA  
    MAXLEN DB 255         ; MAXIMUM BUFFER SIZE (255 CHARACTERS)  
    ACTLEN DB ?           ; ACTUAL LENGTH OF INPUT (FILLED AFTER INPUT)  
    INPUT DB 255 DUP('$') ; BUFFER TO STORE USER INPUT

    MSG DB 'ENTER A STRING: $' ; PROMPT MESSAGE
.CODE  
    MAIN PROC FAR  
        ; INITIALIZE DATA SEGMENT  
        MOV AX, @DATA  
        MOV DS, AX  

        ; DISPLAY MESSAGE "ENTER A STRING: "  
        LEA DX, MSG          ; Store address of MSG in DX
        MOV AH, 09H          ; DOS FUNCTION 09H (PRINT STRING)  
        INT 21H  

        ; READ STRING FROM USER  
        LEA DX, MAXLEN        ; SET BUFFER LOCATION  
        MOV AH, 0AH           ; DOS FUNCTION 0AH (BUFFERED INPUT)  
        INT 21H

         ; DISPLAY ENTERED STRING  
        LEA DX, INPUT         ; SKIP FIRST TWO BYTES (MAXLEN & ACTLEN)  
        MOV AH, 09H           ; DOS FUNCTION 09H (PRINT STRING)  
        INT 21H  

```

### Clear Screeen
```Assembly
.code
    main proc far 
        
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

     main endp
 end
```

### Index  
- Other than SI, BX and DI can also be used as index.
---

## 🛠️ Contributions
Contributions are welcome! If you want to add new programs or improve existing ones, feel free to submit a pull request.

---
Happy Coding! 😊
