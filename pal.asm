.model small
.stack 100h
.data
string1 db 60 dup(0)
string2 db 60 dup(0)
var dw 0
msg db 'palindrome$'
msg1 db 'not palindrome$'
.code
 main proc

	mov ax,@data
	mov ds,ax
	mov es,ax
	mov bx,0
	mov si,0
	lea di,string1
	mov ah,1
	int 21h
while_:
	cmp al,0dh
	je endwhile_
	stosb
	inc bx
	int 21h
	jmp while_

endwhile_:
	mov cx,bx
	mov var,cx
	lea si,string1
	dec bx
	mov di,0
	add si,bx
	lea di,string2
	std
reverse:
	movsb
	add di,2
	loop reverse
	mov cx,var
palindrome:
	
	lea si,string1
	lea di,string2
	cld
	repe cmpsb
	jne no
	mov dl,0dh
	mov ah,2
	int 21h
	mov dl,0ah
	int 21h
	mov ah,9
	lea dx,msg
	int 21h
	jmp exit

no:
	mov ah,9
	lea dx,msg1
	int 21h
exit:

	mov ah,4ch
	int 21h
	
	

	
	
	
	
 main endp
end main