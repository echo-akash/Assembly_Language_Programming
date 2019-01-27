.model small
.stack 100h
.data
string db 70 dup(?)
vo db 0
co db 0
vowel db 'AEIOU'
consonant db 'BCDFGHJKLMNPQRSTVWXYZ'
.code
 main proc
	mov ax,@data
	mov ds,ax
	mov es,ax

	lea di,string
	xor bx,bx
	cld
	mov ah,1
	int 21h
while_:
	cmp al,0dh
	je end_
	stosb
	inc bx
	int 21h
	jmp while_
end_:	
	lea di,string
	mov si,di
	cld
repeat:
	lodsb
	lea di,vowel
	mov cx,5
	repne scasb
	jne conso
	inc vo
	jmp until
conso:
	lea di,consonant
	mov cx,21
	repne scasb
	jne until
	inc co
	
until:
	dec bx
	jne repeat
	
	mov dl,0dh
	mov ah,2
	int 21h

	mov dl,0ah
	int 21h


	mov ah,2
	mov dl,vo
	add dl,48
	int 21h
	
	mov ah,2
	mov dl,co
	add dl,48
	int 21h

	mov ah,4ch
	int 21h

 main endp
end main