.model small
.stack 100h
.data
var db 0
msg db 0dh,0ah,'type a binary:$'
msg1 db 0dh,0ah,'in hexa:$'
msg2 db 0dh,0ah,'wrong$'
.code
main proc
	mov ax,@data
	mov ds,ax
in_:	lea dx,msg
	mov ah,9
	int 21h

	xor bx,bx
	mov ah,1
while_:	int 21h
	cmp al,49
	jg wrong
	cmp al,0dh
	je end_
	sub al,48
	shl bx,1
	or bl,al
	jmp while_
wrong:
	lea dx,msg2
	mov ah,9
	int 21h
	jmp in_

end_:	lea dx,msg1
	mov ah,9
	int 21h
	
	mov var,4
	MOV CL,4

top:	MOV DL,BH
	shr dl,cl
	cmp dl,10
	jge next
	add dl,48
	jmp out_
next:
	add dl,55
out_:
	mov ah,2
	int 21h
	rol bx,cl
	dec var
	cmp var,0
	jne top
mov ah,4ch
int 21h
main endp
end main