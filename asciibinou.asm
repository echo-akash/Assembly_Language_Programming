.model small
.stack 100h
.data
ms1 db 'Enter the number',0dh,0ah,'$'
ms2 db 0dh,0ah,'Count=$'
count db ?
ms3 db 0dh,0ah,'even$'
ms4 db 0dh,0ah,'odd$'
.code
main proc
	mov ax,@data
	mov ds,ax
	
	lea dx,ms1
	mov ah,9
	int 21h

	mov ah,1
	int 21h
	mov bl,al
	mov bh,0

	mov count,'0'

	mov cx,16

	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h
	

top:	rol bx,1
	jc output_1
	jnc Output_2
	
output_1:mov dl,'1'
	mov ah,2
	int 21h
	inc count
	jmp next

output_2:mov dl,'0'
	mov ah,2
	int 21h
	jmp next

next: loop top

	
	lea dx,ms2
	mov ah,9
	int 21h
	mov dl,count
	mov ah,2
	int 21h

	test al,1
	jz below
	

below:	lea dx,ms3
	mov ah,9
	int 21h


	

	mov ah,4ch
	int 21h
	

main endp
end main