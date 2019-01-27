.model small
.stack 100h
.data

msg db 'this is a message$'
.code
main proc

	mov ax,@data
	mov ds, ax

	mov cx,17
	lea si,msg
	;mov si,0
	mov ah,2
top:
	cmp byte ptr [si]," "
	je next
	sub byte ptr [si],32
next:	mov dx,[si]
	
	int 21h

	inc si
	loop top
	
	mov ah,4ch
	int 21h	
	
main endp
end main