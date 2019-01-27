.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
var db '?'
.code
	
main proc
	mov ax,@data
	mov ds,ax

	xor bx,bx
	mov ah,1
	int 21h
WHILE_:cmp al,0dh
	je ENDWHILE_
	and al,0fh
	shl bx,1
	or bl,al
	int 21h
	jmp WHILE_
ENDWHILE_:
	mov ah,9
	lea dx,msg
	int 21h
	mov var,4
	mov cl,4
TOP:	
	mov dl,bh
	shr dl,cl
	cmp dl,10
	jl TOP1
	jge TOP0 

TOP1:	add dl,48
	mov ah,2
	int 21h
	jmp NEXT

TOP0:	add dl,55
	mov ah,2
	int 21h
	jmp NEXT
NEXT:	dec var	
	rol bx,c
	cmp var,0
	je exit
	jmp TOP
exit:

mov ah,4ch
int 21h

main endp
end main