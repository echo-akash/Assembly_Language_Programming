.model small
.stack 100h
.data	
	msg db 0dh,0ah,'Enter a hex number:$'
	msg1 db 0dh,0ah,'Output:$'
	var dw 4
	var1 dw 0
.code
main proc
	mov ax,@data
	mov ds,ax
	
	mov ah,9
	lea dx,msg
	int 21h
	call input
	mov var1,bx
	
	mov ah,9
	lea dx,msg
	int 21h
	call input
	jmp sum
sum:
	add var1,bx
	mov bx,var1
	
	mov ah,9
	lea dx,msg1
	int 21h
	;xor cx,cx
	mov cl,4
top:	mov dl,bh
	shr dl,cl
	cmp dl,10
	jge else_
	add dl,48
	jmp next
else_:
	add dl,55
	jmp next
next:
	mov ah,2
	int 21h
	dec var
	rol bx,cl
	cmp var,0
	je exit
	jmp top
exit:
	mov ah,4ch
	int 21h

main endp

input proc	
	xor bx,bx
	mov cl,4
	mov ah,1
	int 21h
while_:
	cmp al,0dh
	je end_
	cmp al,39h
	jg letter
	and al,0fh
	jmp shift
letter:
	sub al,37h
shift:
	shl bx,cl
	or bl,al
	int 21h
	jmp while_
end_:
ret
input endp
end main