.model small
.stack 100h
.data
newline db 0dh,0ah,'$'
nott db 0dh,0ah,'not leapyear$'
yesm db 0dh,0ah,'leapyear$'
var1 dw '?'
var2 dw '?'
var dw '?'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov var,0
	mov var1,0
	mov var2,0
	call input
	call leapyear
	
	mov ah,4ch
	int 21h

main endp

input proc
	mov bx,0
top:
	mov ah,1
	int 21h
	cmp al,0dh
	je end_top
	mov ah,0
	sub ax,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp top

end_top:
	lea dx,newline
	mov ah,9
	int 21h

ret	
input endp

leapyear proc
	mov ax,bx
	mov var1,4
	mov var2,100
	mov var,400
	
level1:	cwd
	div var1
	cmp dx,0
	je level2
	jmp not_


level2:	mov ax,bx
	cwd
	div var2
	cmp dx,0
	jne yes
	mov ax,bx
	cwd
	div var
	cmp dx,0
	je yes
	jmp not_
 
yes: lea dx,yesm
	mov ah,9
	int 21h
	jmp exit_
not_:lea dx,nott
	mov ah,9
	int 21h
	
exit_: ret
leapyear endp
end main