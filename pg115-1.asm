.model small
.stack 100h
.data
msg db 0dh,0ah,'ENTER A HEXA DIGIT:$'
MSG1 DB 0DH,0AH,'IN DECIMAIL:$'
MSG2 DB 0DH,0AH,'WRONG INPUT$'
MSG3 DB 0DH,0AH,'DO U WANT TO GIVE INPUT AGAIN?$'
.code
main proc
	mov ax,@data
	MOV DS,AX
IN_:	lea dx,msg
	mov ah,9
	int 21h

	mov ah,1
	int 21h
	mov bl,al

	cmp bl,'0'
	jl wrong
	cmp bl,'9'
	jg again
	lea dx,msg1
	mov ah,9
	int 21h
	mov dl,bl
	mov ah,2
	int 21h
	JMP NEXT

again:
	cmp bl,'A'
	jl wrong
	cmp bl,'F'
	jg wrong
	lea dx,msg1
	mov ah,9
	int 21h

	mov dl,'1'
	MOV AH,2
	INT 21H
	MOV DL,BL
	SUB DL,17
	MOV AH,2
	INT 21H
	JMP NEXT
WRONG:
	LEA DX,MSG2
	MOV AH,9
	INT 21H
NEXT:
	LEA DX,MSG3
	MOV AH,9
	INT 21H
	MOV AH,1
	INT 21H
	CMP AL,'y'
	JE IN_
	cmp al,'Y'
	je in_
	
exit_:
mov ah,4ch
int 21h
main endp
end main