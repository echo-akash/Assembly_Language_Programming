.model small
.stack 100h
.data
str1 db 80 dup (?)
vowels db 'aeiou'
consonants db 'bcdfghjklmnpqrstvwxyz'
out1 db 0dh,0ah,'VOWELS=$'
out2 db 0dh,0ah,'CONSONANTS=$'
vow dw 0
con dw 0
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea di,str1
	call read
	lea si,str1
	cld
repeat_:
	lodsb
	lea di,vowels
	mov cx,5
	repne scasb
	jne cnst_
	inc vow
	jmp until
cnst_:
	lea di,consonants
	mov cx,21
	repne scasb
	jne until
	inc con
until:
	dec bx
	jne repeat_
	
	mov ah,9
	lea dx,out1
	int 21h
	mov ax,vow
	call decimal
	
		
	mov ah,9
	lea dx,out2
	int 21h
	mov ax,con
	call decimal
	
	
mov ah,4ch
int 21h
main endp
read proc
	push ax
	push di
	cld
	xor bx,bx
	mov ah,1
	int 21h
	
top:	
	cmp al,0dh
	je end_
	stosb
	inc bx
	int 21h
	jmp top
end_:
	pop ax
	pop di
	ret
read endp
decimal proc
	mov bx,10
	xor cx,cx
again:
	cwd
	div bx
	push dx
	inc cx
	cmp ax,0
	je shesh
	jmp again
shesh:
	pop dx
	add dl,48
	mov ah,2
	int 21h
	loop shesh
ret	
decimal endp	

end main	