.model small
.stack 100h
.data
var1 dw 0
var2 dw 0
var3 dw 0
var4 dw 0
var5 dw 0
var6 dw 0
var7 dw 0
var8 dw 0
var9 dw 0
msg1 db 0dh,0ah,'current year:$'
msg2 db 0dh,0ah,'current month:$'
msg3 db 0dh,0ah,'current date:$'
msg4 db 0dh,0ah,'birth year:$'
msg5 db 0dh,0ah,'birth month:$'
msg6 db 0dh,0ah,'birthdate:$'
.code
main proc
	mov ax,@data
	mov ds,ax

	lea dx,msg1
	mov ah,9
	int 21h

	call input
	mov var1,bx

	lea dx,msg2
	mov ah,9
	int 21h

	call input
	mov var2,bx

	lea dx,msg3
	mov ah,9
	int 21h

	call input
	mov var3,bx

	lea dx,msg4
	mov ah,9
	int 21h

	call input
	mov var4,bx
	
	lea dx,msg5
	mov ah,9
	int 21h

	call input
	mov var5,bx

	lea dx,msg6
	mov ah,9
	int 21h

	

	call input
	mov var6,bx

	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h

	mov bx,var3
	cmp bx,var6
	jl day_big

	sub bx,var6
	mov var7,bx
	
mnth_chk:
	mov bx,var2
	cmp bx,var5
	jl mnth_big

	sub bx,var5
	mov var8,bx
	
mouri:	mov bx,var1
	sub bx,var4

	mov var9,bx
	jmp out__

day_big:
	add var3,30
	mov bx,var3
	sub bx,var6
	mov var7,bx

	sub var5,1
	jmp mnth_chk
mnth_big:
	add var2,12
	mov bx,var2
	sub bx, var5
	mov var8,bx

	sub var4,1
	jmp mouri
	
out__:
	

	mov ax,var9
	call output

	mov dl,' '
	mov ah,2
	int 21h

	mov ax,var8
	call output

	mov dl,' '
	mov ah,2
	int 21h

	mov ax,var7
	call output

	mov dl,' '
	mov ah,2
	int 21h	
mov ah,4ch
int 21h
main endp

input proc

	xor bx,bx
while_:
	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	mov ah,0
	sub ax,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp while_
end_:
	ret
input endp
output proc
	xor cx,cx
	mov bx,10
top:
	cwd
	div bx
	push dx
	inc cx
	cmp ax,0
	jne top
out_:
	pop dx
	add dx,48
	mov ah,2
	int 21h
	loop out_
	ret
output endp
end main