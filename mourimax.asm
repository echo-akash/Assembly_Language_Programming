.model small
.stack 100h
.data
	msg db 100 dup(?)
	
	msg1 db 0dh,0ah,'$'
.code

main proc

	mov ax,@data
	mov ds,ax
	mov ah,1
	
	mov si,0
	
input:
	int 21h
	cmp al,0dh
	je mouri
	mov byte ptr msg[si],al
	inc si
	jmp input
	
mouri:	mov ah,9
	lea dx,msg1
	int 21h
	
	mov cx,si
	mov si,0
	mov al,0

max:
	cmp byte ptr msg[si],al
	jg update
	dec cx
	inc si
	cmp cx,0
	je out_
	jmp max

update:
	mov al,byte ptr msg[si]
	dec cx
	inc si
	cmp cx,0
	je out_
	jmp  max

out_:
	mov dl,al
	mov ah,2
	int 21h
exit:
	mov ah,4ch
	int 21h

main endp
end main
	
	














