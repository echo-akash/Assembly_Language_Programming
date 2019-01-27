.model small
.stack 100h
.data
var db 0
msg db 0dh,0ah,'enter a hexa num:$'
msg1 db 0dh,0ah,'in binary:$'
msg2 db 0dh,0ah,'wrong input,try again:$'

.code
main proc
	mov ax,@data
	mov ds,ax
	lea dx,msg
	mov ah,9
	int 21h

input:	xor bx,bx
	mov cl,4
	mov ah,1
while_:	int 21h
	cmp al,0dh
	je end_
	cmp al,39h
	jg letter
	sub al,48
	jmp shift
letter:
	cmp al,'A'
	jl wrong
	cmp al,'F'
	jg wrong
	sub al,55
shift:
	shl bx,cl
	or bl,al
	jmp while_
wrong:
	lea dx,msg2
	mov ah,9
	int 21h
	jmp input
end_:
	lea dx,msg1
	mov ah,9
	int 21h

	mov cl,16
top:	rol bx,1
	jc top1
	mov dl,'0'
	jmp out_
top1:
	mov dl,'1'
out_:
	mov ah,2
	int 21h
	loop top	
	
mov ah,4ch
int 21h
main endp
end main
