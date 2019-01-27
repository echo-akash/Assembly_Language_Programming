.model small
.stack 100h
.data 
	x dw 100 dup (0)
	n dw ?
	y dw 0		
	msg  db 0dh , 0ah , 'Enter a number : $'

.code

input proc
	push ax
	push bx
	push cx
	push dx
	push si
	mov bx,0
	mov cx,0	
	mov si,0
top:
	mov ah,1
	int 21h
	mov ah,0
	cmp al,0dh
	je endtop
	
	cmp al,' '
	je process
	
	sub ax,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp top
	
process:
	mov x[si],bx
	add si,2
	add y,1
	mov bx,0
	jmp top

endtop:	
	mov x[si],bx
	add y,1
	
	pop ax
	pop bx
	pop cx
	pop dx
	pop si
	ret

input endp 

select proc 
		push bx
		push cx
		push dx
		push si
		dec bx

		je end_sort
		lea si,x
		mov dx , si

	sort_loop:
		
		mov si , dx 
		mov cx , bx
		mov di , si	
		mov ax , [di]

	find_big:
		
		add si,2
		cmp [si] , ax
		
		jng next

		mov di , si
		mov ax , [di]

	next:
		loop find_big

		call swap

		dec bx

		jne sort_loop
		
	end_sort:
			
		pop si
		pop dx
		pop cx
   		pop bx
	
		ret
		
select endp


swap proc
	push ax
		
	mov ax , [si]
	xchg al , [di]
	mov [si] , al

	pop ax

	ret
swap endp


main proc
		mov ax , @data
		mov ds , ax
		lea si , x
		
	 	call input
		mov bx,y
		call select

		mov ah , 2
		mov dl , 0dh
		int 21h
		mov dl , 0ah
		int 21h
		
	mov bx,10d
	mov si,0

print:
	cmp y,0
	je exit
	mov ax,0
	mov ax,x[si]
	add si,2
	mov bx,10d
	mov cx,0
repeat:
	mov dx,0
	div bx
	push dx
	inc cx
	or ax,ax
	jne repeat

output:
	pop dx
	add dx,48
	mov ah,2
	int 21h
	loop output
	mov ah,2
	mov dl,' '
	int 21h
	sub y,1
	jmp print

exit:
			
	mov ah , 4ch
	int 21h	
					
main endp
	end main
  