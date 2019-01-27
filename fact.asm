.model small
.stack 100h
.data
.code
 main proc

	 CALL input           ; call the procedure BINARY_INPUT

     CALL fact               ; call the procedure FACTORIAL


     CALL output           ; call the procedure BINARY_OUTPUT

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
 main endp

 input proc

	
   MOV CX, 4                      ; initialize loop counter
   XOR bx,bx                    ; clear DL
   MOV AH, 1                      ; set input function

   @LOOP_1:                       ; loop label
     INT 21H                      ; read a digit

     CMP AL, 0DH                  ; compare input and CR
     JE @END                      ; jump to label @END if input is CR
     AND AL, 0FH                  ; convert ascii to decimal code
     SHL BL, 1                    ; shift BX by 1 position towards left
     OR  BL, AL                   ; place the input decimal digit in BL
   LOOP @LOOP_1                   ; jump to label @LOOP_1 if CX!=0

   @END:                          ; jump label

   RET                            ; return control to the calling procedure
 input endp

 output proc

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
 output endp
 

 fact proc

	mov ax,1
	xor cx,cx
	mov cx,bx
	
	top:
		mul cx
		loop top
	mov bx,ax
	ret
 fact endp
end main