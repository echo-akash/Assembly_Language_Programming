.model small
.stack 100h
.data
var dw 0
var1 dw 0
var2 dw 0
var3 dw 0
msg db 0dh,0ah,'$'
.code
main proc
	mov ax,@data
	mov ds,ax
	
	mov var1,0
while_:
	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	mov ah,0
	sub ax,48
	push ax
	mov ax,10
	mul var1
	pop var1
	add var1,ax
	jmp while_
end_:		
	
	lea dx,msg
	mov ah,9
	int 21h



	mov var,0
	mov bx,1

	mov dx,var
	add dx,48
	mov ah,2
	int 21h
	
	mov dl,','
	mov ah,2
	int 21h

	mov dx,bx
	add dx,48
	mov ah,2
	int 21h
	sub var1,2
	
	
top:	mov dl,','
	mov ah,2
	int 21h
	
	mov cx,var
	add cx,bx
	mov dx,cx
	call output
	mov var,bx
	mov bx,cx
	dec var1
	cmp var1,0
	jne top

mov ah,4ch
int 21h
main endp
output proc

	mov var2,10
	mov ax,dx
toop:	cwd
	div var2
	push dx
	inc var3
	cmp ax,0
	jne toop
out_:
	pop dx
	
	add dx,48
	mov ah,2
	int 21h
	dec var3
	cmp var3,0
	jne out_
ret
		

output endp

end main	