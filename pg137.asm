.model small
.stack 100h
.data
msg db 'enter a decimal num:$'
msg1 db 0dh,0ah,'sum in hexa:$'
msg2 db 0dh,0ah,'$'
var db '?'
.code
main proc
	mov ax,@data
	mov ds,ax
	lea dx,msg
	mov ah,9
	int 21h
	mov bl,0
while_:	
	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	sub al,48
	add bl,al
	jmp while_
end_:
	mov bh,0

	lea dx,msg1
	mov ah,9
	int 21h
	
	mov var,4
	mov cl,4
output:
		
	mov dl,bh
	shr dl,cl
	cmp dl,10
	jl next
	add dl,55
	jmp outt_
next:
	add dl,48
outt_:
	mov ah,2
	int 21h
	dec var
	rol bx,cl
	cmp var,0
	jne output
mov ah,4ch
int 21h
main endp 
end main