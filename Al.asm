
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

 TITLE AL-055 : An AL Program that will read a positive binary number and
              ; print its factorial in decimal form using MUL and DIV
              ; instructionsand use OUTDEC procedure for decimal output.
              ; ( suppose that there is no overflow ) 

 .MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter a Positive Binary number ( max. 8-bit ) : $'
   PROMPT_2  DB  0DH,0AH,'The Factorial of the given number in Decimal form is : $'
   ILLEGAL   DB  0DH,0AH,'Illegal character. Try again : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and display the string PROMPT_1
     MOV AH, 9
     INT 21H

     CALL BINARY_INPUT            ; call the procedure BINARY_INPUT

     CALL FACTORIAL               ; call the procedure FACTORIAL

     LEA DX, PROMPT_2             ; load and display the string PROMPT_2
     MOV AH, 9 
     INT 21H

     MOV AX, BX                   ; set AX=BX

     CALL OUTDEC                  ; call the procedure OUTDEC

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP

 ;**************************************************************************;
 ;**************************************************************************;
 ;-------------------------  Procedure Definitions  ------------------------;
 ;**************************************************************************;
 ;**************************************************************************;

 ;**************************************************************************;
 ;----------------------------  BINARY_INPUT  ------------------------------;
 ;**************************************************************************;

 BINARY_INPUT PROC
   ; this procedure will read a number in binary form    
   ; input : none
   ; output : store binary number in BL
   ; uses : MAIN

   JMP @BEGIN                     ; jump to label @BEGIN

   @ERROR:                        ; jump label

   LEA DX, ILLEGAL                ; load and display the string ILLEGAL
   MOV AH, 9
   INT 21H

   @BEGIN:                        ; jump label

   MOV CX, 8                      ; initialize loop counter
   XOR BX, BX                     ; clear BX
   MOV AH, 1                      ; set input function

   @INPUT:                        ; loop label
     INT 21H                      ; read a digit

     CMP AL, 0DH                  ; compare input and CR
     JE @END                      ; jump to label @END if input is CR

     CMP AL, 30H                  ; compare AL with 0
     JL @ERROR                    ; jump to label @ERROR if AL<0

     CMP AL, 31H                  ; compare AL with 1
     JG @ERROR                    ; jump to label @ERROR if AL>1

     AND AL, 0FH                  ; convert ascii to decimal code
     SHL BL, 1                    ; shift BL by 1 position towards left
     OR  BL, AL                   ; place the input decimal digit in BL
   LOOP @INPUT                    ; jump to label @INPUT if CX!=0

   @END:                          ; jump label

   RET                            ; return control to the calling procedure
 BINARY_INPUT ENDP

 ;**************************************************************************;
 ;-------------------------------  OUTDEC  ---------------------------------;
 ;**************************************************************************;

 OUTDEC PROC
   ; this procedure will display a decimal number
   ; input : AX
   ; output : none
   ; uses : MAIN

   ;PUSH BX                        ; push BX onto the STACK
   ;PUSH CX                        ; push CX onto the STACK
   ;PUSH DX                        ; push DX onto the STACK

   XOR CX, CX                     ; clear CX
   MOV BX, 10                     ; set BX=10

   @OUTPUT:                       ; loop label
     XOR DX, DX                   ; clear DX
     DIV BX                       ; divide AX by BX
     PUSH DX                      ; push DX onto the STACK
     INC CX                       ; increment CX
     OR AX, AX                    ; take OR of Ax with AX
   JNE @OUTPUT                    ; jump to label @OUTPUT if ZF=0

   MOV AH, 2                      ; set output function

   @DISPLAY:                      ; loop label
     POP DX                       ; pop a value from STACK to DX
     OR DL, 30H                   ; convert decimal to ascii code
     INT 21H                      ; print a character
   LOOP @DISPLAY                  ; jump to label @DISPLAY if CX!=0

;   POP DX                         ; pop a value from STACK into DX
 ;  POP CX                         ; pop a value from STACK into CX
  ; POP BX                         ; pop a value from STACK into BX

   RET                            ; return control to the calling procedure
 OUTDEC ENDP

 ;**************************************************************************;
 ;-----------------------------  FACTORIAL  --------------------------------;
 ;**************************************************************************;

 FACTORIAL PROC
   ; this procedure will computes the factorial of a given number
   ; input : BL
   ; output : store the factorial of the number in BX
   ; uses : MAIN

   MOV AX, 1                      ; set AX=1

   XOR CX, CX                     ; clear CX
   MOV CX, BX                     ; set CX=BX

   @LOOP:                         ; loop label
     MUL CX                       ; multiply CX with AL i.e. AX=AL*CX
   LOOP @LOOP                     ; jump to label @LOOP if CX!=0

   MOV BX, AX                     ; set BX=AX

   RET                            ; return control to the calling procedure
 FACTORIAL ENDP

 ;**************************************************************************;
 ;--------------------------------------------------------------------------;
 ;**************************************************************************;

 END MAIN

 ;**************************************************************************;
 ;**************************************************************************;
 ;------------------------------  THE END  ---------------------------------;
 ;**************************************************************************;
 ;**************************************************************************;
