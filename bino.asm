.model small
.stack 100h
.data
	msg db 0dh,0ah,'enter a binary no:$'
	msg1 db 0dh,0ah,'output:$'
	;msg0 db 0dh,0fh,'output:0'
	var dw 0
	var1 dw 0
	co dw 0
	
	
.code
main proc	
	mov ax,@data
	mov ds,ax
	mov ah,9
	lea dx,msg
	int 21h
	xor dx,dx
	;mov var,0
	
	call input
	mov var1,bx
	mov ah,9
	lea dx,msg
	int 21h
	call input
	

sum:
	add var1,bx
	mov bx,var1
	
	mov ah,9
	lea dx,msg1
	int 21h
	
rot:
	rol bx,1
	jnc top1
	jc count
top1:
	inc co
	jmp rot
count:
	mov cx,16
	sub cx,co
	dec cx
	mov dl,'1'
	mov ah,2
	int 21h
	
top:
	rol bx,1
	jc out1
	jmp out0
out1:
	
	
	mov dl,'1'
	mov ah,2
	int 21h
	jmp lvl
	jmp end1
out0:

	
	mov dl,'0'
	mov ah,2
	int 21h
	jmp lvl

lvl:
	
	loop top
end1:
	mov ah,4ch
	int 21h
main endp
input proc
	xor bx,bx
	mov ah,1
	int 21h
while_:
	cmp  al,0dh
	je end_
	and al,0fh
	shl bx,1
	or bl,al
	int 21h
	jmp while_
end_:
	

ret
input endp
end main