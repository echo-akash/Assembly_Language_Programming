.model small
.stack 100h
.data

msg dw 9,3,5,3,6
var dw '?'
var1 dw '?'
.code

main proc

	mov ax,@data
	mov ds,ax

	mov si,0
	mov bx,2
	mov var,bx
	mov cx,4
	mov var1,4

top:

    mov ax,word ptr msg[si]
	cmp ax,word ptr msg[bx]
    jng next
    xchg ax,msg[bx]

    
next:
    
    add bx,2
    mov msg[si],ax
    loop top
	
mouri:
	add si,2
	dec var1
	mov cx,var1
	add var,2
	mov bx,var
	cmp si,6
	jg output
	jmp top

output:
	mov si,0
	mov cx,5
	mov ah,2

top1:
	
	mov dx,word ptr msg[si]
	add dl,48
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
	
	