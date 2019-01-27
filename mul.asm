.model small
.stack 100h
.data
	VALUE_1   DB  ?
   	VALUE_2   DB  ?
	
.code
 main proc

	MOV AX, @DATA                ; initialize DS  
 	MOV DS, AX


	call input

	 MOV VALUE_1, DL              ; save the first value in VALUE_1


	call input

	MOV VALUE_2, DL              ; save the second value in VALUE_2

	call multiply
	
	     MOV BX, DX                   ; move the result from DX to BX
	call output
	
	mov ah,4ch
	int 21h

 main endp


	;INPUT

 input proc
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

	RET
		

 input endp


	;output

output proc

	mov cx,16
	mov ah,2
	
 @LOOP_2:                       ; loop label
     rol BX, 1                    ; shift BX by 1 position towards left
     JC @ONE                      ; jump to label @ONE if CF=1

     MOV DL, 30H                  ; move 0 to DL
     JMP @DISPLAY                 ; jump tp label @DISPLAY

     @ONE:                        ; jump label
       MOV DL, 31H                ; move 1 to DL

     @DISPLAY:                    ; jump label
       INT 21H                    ; display a digit 
   LOOP @LOOP_2                   ; jump to label @LOOP_2 if CX!=0

ret
output endp
		

	;MULTIPLY

 multiply proc

	XOR DX, DX                     ; clear DX
   	XOR BX, BX
   	XOR AX, AX

	mov al,VALUE_1
	mov bl, VALUE_2

TOP_:
	test bx,1
	jz end_if
	
	add dx,ax

end_if:
	shl ax,1
	shr bx,1
	
	
	jnz TOP_

	
	ret
	

 multiply endp
end main