.model small
.stack 100h
.data
msg1 db 0dh,0ah,'type a char:$'
msg2 db 0dh,0ah,'in hex:$'
var db,'?'
.code
main proc
	mov ax,@data
	mov ds,ax
input:
	lea dx,msg1
	mov ah,9
	int 21h
	mov ah,1
	int 21h
	cmp al,0dh
	je exit_
	mov ah,0
	mov bx,ax
	
	mov var,4
	mov cl,4
	lea dx,msg2
	mov ah,9
	int 21h
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
jmp input	
exit_:	
mov ah,4ch
int 21h
main endp 
end main	