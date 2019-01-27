

 ;**************************************************************************;
 ;                                                                          ; 
 ;	  By :                                                              ;
 ;		Muhammad Tahir Shahzad  [ MTS ]                             ;
 ;		B.C.S Honours  [ 2000-04 ]                                  ;
 ;		Government College University Lahore                        ;
 ;		Pakistan                                                    ;
 ;                                                                          ;
 ;    E-mail :  mtshome@wol.net.pk                                          ;
 ;                                                                          ;
 ;  Web-Site :  www.mts-home.cjb.net  [ www.wol.net.pk/mtshome ]            ;
 ;		www.mtshome.cjb.net   [ www.geocities.com/mtahirshahzad ]   ;
 ;                                                                          ;
 ;**************************************************************************;

 TITLE AL-049 : An AL Program that read two numbers in binary form, computes
              ; and display their product by ADD and SHIFT instructions using
              ; procedures.

 .MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter the first binary number  (max 8-bit) - A : $'
   PROMPT_2  DB  'Enter the second binary number (max 8-bit) - B : $'
   PROMPT_3  DB  'Result - ( A * B ) : $'

   VALUE_1   DB  ?
   VALUE_2   DB  ?

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS  
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and display PROMPT_1  
     MOV AH, 9
     INT 21H

     CALL READ_BINARY_NUMBER      ; call the procedure READ_BINARY_NUMBER

     MOV VALUE_1, DL              ; save the first value in VALUE_1

     CALL NEXT_LINE               ; call the procedure NEXT_LINE

     LEA DX, PROMPT_2             ; load and display PROMPT_2  
     MOV AH, 9
     INT 21H

     CALL READ_BINARY_NUMBER      ; call the procedure READ_BINARY_NUMBER

     MOV VALUE_2, DL              ; save the second value in VALUE_2

     CALL NEXT_LINE               ; call the procedure NEXT_LINE

     LEA DX, PROMPT_3             ; load and display PROMPT_3
     MOV AH, 9
     INT 21H

     CALL MULTIPLY                ; call the procedure MULTIPLY

     MOV BX, DX                   ; move the result from DX to BX

     CALL DISPLAY_BINARY_NUMBER   ; call the procedure DISPLAY_BINARY_NUMBER

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP

 ;**************************************************************************;
 ;**************************************************************************;
 ;------------------------  PROCEDURE DEFINITIONS  -------------------------;
 ;**************************************************************************;
 ;**************************************************************************;

 ;**************************************************************************;
 ;-----------------------------  NEXT_LINE  --------------------------------;
 ;**************************************************************************;

 NEXT_LINE PROC
   ; this procedure will move the cursor to the next line
   ; input : none
   ; output : none
   ; uses : MAIN

   PUSH AX                   ; push AX onto the STACK
   PUSH DX                   ; push DX onto the STACK

   MOV AH, 2                 ; set output function
   MOV DL, 0DH               ; carriage return
   INT 21H                   

   MOV DL, 0AH               ; line feed
   INT 21H

   POP DX                    ; pop a value from STACK to DX
   POP AX                    ; pop a value from STACK to AX

   RET                       ; return control to the calling procedure
 NEXT_LINE ENDP

 ;**************************************************************************;
 ;--------------------------  READ_BINARY_NUMBER  --------------------------;
 ;**************************************************************************;

 READ_BINARY_NUMBER PROC
   ; this procedure will read a number in binary form    
   ; input : none
   ; output : store binary number in DL
   ; uses : MAIN

   MOV CX, 8                      ; initialize loop counter
   XOR DL, DL                     ; clear DL
   MOV AH, 1                      ; set input function

   @LOOP_1:                       ; loop label
     INT 21H                      ; read a digit

     CMP AL, 0DH                  ; compare input and CR
     JE @END                      ; jump to label @END if input is CR
     AND AL, 0FH                  ; convert ascii to decimal code
     SHL DL, 1                    ; shift BX by 1 position towards left
     OR  DL, AL                   ; place the input decimal digit in BL
   LOOP @LOOP_1                   ; jump to label @LOOP_1 if CX!=0

   @END:                          ; jump label

   RET                            ; return control to the calling procedure
 READ_BINARY_NUMBER ENDP

 ;**************************************************************************;
 ;------------------------  DISPLAY_BINARY_NUMBER  -------------------------;
 ;**************************************************************************;

 DISPLAY_BINARY_NUMBER PROC
   ; this procedure will display a number in binary form    
   ; input : BX  
   ; output : none                       
   ; uses : MAIN

   MOV CX, 16                     ; initialize loop counter
   MOV AH, 2                      ; set output function

   @LOOP_2:                       ; loop label
     SHL BX, 1                    ; shift BX by 1 position towards left
     JC @ONE                      ; jump to label @ONE if CF=1

     MOV DL, 30H                  ; move 0 to DL
     JMP @DISPLAY                 ; jump tp label @DISPLAY

     @ONE:                        ; jump label
       MOV DL, 31H                ; move 1 to DL

     @DISPLAY:                    ; jump label
       INT 21H                    ; display a digit 
   LOOP @LOOP_2                   ; jump to label @LOOP_2 if CX!=0

   RET                            ; return control to the calling procedure
 DISPLAY_BINARY_NUMBER ENDP 

 ;**************************************************************************;
 ;-------------------------  REVERSE_BIT_PATTERN  --------------------------;
 ;**************************************************************************;

 MULTIPLY PROC
   ; this procedure will multiply two binary numbers     
   ; input : BL, BH
   ; output : store the result in the register DX    
   ; uses : MAIN

   XOR DX, DX                     ; clear DX
   XOR BX, BX
   XOR AX, AX

   MOV AL, VALUE_1
   MOV BL, VALUE_2

   @LOOP_3:                       ; loop label
     TEST BX, 1                   ; test the LSB of BX i.e. 0 or 1     
     JZ @NEXT                     ; jump to label @END_LOOP if ZF=0     

     ADD DX, AX                   ; add the contents of AX into DX

     @NEXT:                       ; loop label

     SHL AX, 1                    ; shift AX towards left by 1 position
     SHR BX, 1                    ; shift BX towards right by 1 position

     JNZ @LOOP_3                  ; jump to label @LOOP_3 if CX!=0

   RET                            ; return control to the calling procedure
 MULTIPLY ENDP

 ;**************************************************************************;
 ;--------------------------------------------------------------------------;
 ;**************************************************************************;

 END MAIN

 ;**************************************************************************;
 ;**************************************************************************;
 ;------------------------------  THE END  ---------------------------------;
 ;**************************************************************************;
 ;**************************************************************************;
