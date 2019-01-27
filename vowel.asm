.model small
.stack 100H
.data
	str1 db 70 dup (?)
	msg db 0dh,0ah,'$'
	vol db 'AEIOU'
	con db 'BCDFGHJKLMNPQRSTVWXYZ'
	msg1 db 0ah,0dh,'vowels=$'
	msg2 db 0ah,0dh,'consonents=$'
	vc dw 0
	cc dw 0
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax

	lea di,str1
	call read_str

	mov si,di
	cld	

repeat: 
	lodsb

	lea di,vol
	mov cx,5
	repne scasb
	jne cons
	inc vc
	jmp untill

cons:  
	lea di,con
	mov cx,21
	repne scasb
	jne untill
	inc cc

untill:
	dec bx
	jne repeat
mov ah,9 
	lea dx,msg1
	int 21h
	mov ax,vc
	call output
mov ah,9
	lea dx,msg2
	int 21h
	mov ax,cc
	call output

exit:	mov ah,4ch
	int 21h

main endp

read_str proc
	push ax
	push di
	cld
	xor bx,bx
	
	mov ah,1
	int 21h

while_:  cmp al,0dh
	je end_while

	cmp al,8h
	jne else_
	dec di
	dec bx
	jmp read

else_:  stosb
	inc bx

read:   int 21h
	jmp while_
		
end_while:
	pop di
	pop ax
	ret
read_str endp

output proc
	en:
	push ax
	push bx
	push cx
	push dx

	or ax,ax
	jge end_if
	
	push ax
	mov dl,'-'
	mov ah,2
	int 21h
	pop ax
	neg ax

end_if: xor cx,cx
	mov bx,10d
	
re: xor dx,dx
	div bx
	push dx
	inc cx
	or ax,ax
	jne re
	
	mov ah,2
print:  pop dx
	or dl,30h
	int 21h
	loop print

	pop dx
	pop cx
	pop bx
	pop ax
	ret
  output endp

end main	