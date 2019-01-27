.model small
.stack 100h
.data
msg db 0dh,0ah,'$'
msg1 db 100 dup(0)

.code
 main proc

	mov ax,@data
	mov ds,ax
	xor cx,cx
	mov bl,0
	mov si,0

input:
	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	;cmp al,20h
	;je space
	
;space:
	;and al,000Fh
	
	mov msg1[si],al
	inc si
	jmp input
	
	;add al,48
	
end_:
	
	;and al,000Fh
	;mov  msg1[si],al
	mov dl,0dh
	mov ah,2
	int 21h
	mov dl,0ah
	int 21h
	mov cx,si
	mov si,0
cmp_:	
	cmp msg1[si],bl
	jg max
	inc si
	dec cx
	cmp cx,0
	je l1
	jmp cmp_
max:
	mov bl,msg1[si]
	dec cx
	inc si
	cmp cx,0
	je l1
	jmp cmp_
l1:
	
	mov dl,bl
	mov ah,2
	int 21h
exit:
	mov ah,4ch
	int 21h
 main endp
end main