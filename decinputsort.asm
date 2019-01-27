.model small
.stack 100h
.data

msg dw 100 dup(?)
msg1 db  0dh,0ah,'$'
var  dw '?'
var1 dw '?'
var2 dw '?'
var3 dw '?'
var4 dw '?'
.code

main proc

	mov ax,@data
	mov ds,ax
	mov si,0
	mov var2,0

input:

    xor dx,dx
	xor cx,cx
	mov bx,0

decimal:

	mov ah,1
	int 21h
	cmp al,0dh
	je sort
	
	cmp al,' '
	jmp decimal
	
	
	
	mov ah,0
	sub ax,0
	sub ax,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	mov msg[si],bx
	add si,2
	inc var2
	
	jmp decimal
	
    
 sort:
    
    lea dx,msg1
    mov ah,9
    int 21h
    

    mov ax,var2
    mov var3,ax
    mov ax,var2
    mov var4,ax
    sub var3,2
    mov ax,2
    mul var3
    mov var3,ax
    dec var2
	mov si,0
	mov bx,2
	mov var,bx
	mov cx,var2


top:
	mov ax, msg[si]
	cmp ax, msg[bx]
    jng next
    xchg ax, msg[bx]

    
next:
    
    add bx,2
    mov msg[si],ax
    loop top
	
mouri:
	add si,2
	dec var2
	mov cx,var2
	add var,2
	mov bx,var
	cmp si,var3
	jg output
	jmp top

output:
	mov si,0
	mov cx,var4
	mov ah,2

top1:
	
	mov dx,word ptr msg[si]
	add si,2
	int 21h
	mov dl,' '
	int 21h
	loop top1
	

exit:

	mov ah,4ch
	int 21h

main endp
end main
	
	