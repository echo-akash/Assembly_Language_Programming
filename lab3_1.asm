.model small
.stack 100h
.data
	msg db 0dh,0ah,'Enter a char:$'
	msg1 db 0dh,0ah,'Number of 1:$'
	var dw 0
.code

main proc

	mov ax , @data
	mov ds , ax
	
	lea dx , msg
	mov ah , 9
	int 21h

	mov ah,1
	int 21h
	mov ah,0
	mov var,ax

	mov cl ,8
	mov bl,al
			
print_:
	cmp cl , 0
	je exit

	shl bl , 1
 	jc print_1

	mov dl ,'0'
	mov ah , 2
	int 21h
	
	dec cl
	jmp print_

print_1:
	mov dl ,'1'
	mov ah , 2
	int 21h
		
	dec cl
	jmp print_
exit:

	mov bh,0
	mov bx,var

	lea dx , msg1
	mov ah , 9
	int 21h

		mov cx,16
		mov ax,0
	top:
		rol bx,1
		jnc next
		add ax,1
	next:
		loop top
	
		mov ah,2
		mov dx,ax
		add dx,48
		int 21h 

		mov ah , 4ch
		int 21h
	
main endp
	end main
