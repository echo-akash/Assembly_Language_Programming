.model small
.stack 100h
.data

msg db 1,2,3,4
.code
main proc
	mov ax,@data
	mov ds,ax
	mov bx,0
	mov ah,2
	mov cx,0
top:
	mov dl,msg[bx]
	inc bx
	add dl,48	
	int 21h
	loop top

	mov ah,4ch
	int 21h
		

main endp
end main