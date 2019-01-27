.model small
.stack 100h
.data	
	msg	db	0dh,0ah,'$'
	msg1 db 100 dup(?)
	
.code
	main proc
		mov ax,@data
		mov ds,ax
		
		mov si,0
		mov ah,1
		

	top:	
		int 21h
		
		cmp al,0dh
		je end_top
		mov msg1[si],al
		add si,1
		jmp top

	end_top:
		
		mov dl,msg[si]
		dec si
		mov ah,2
		int 21h
		cmp si,0
		jl exit
		jmp end_top

	exit:	mov ah,4ch
		int 21h	
	main endp
end main
