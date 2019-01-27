.model small
.stack 100h
.data
msg db 0dh,0ah,'wanna scan:$'
msg1 db 0dh,0ah,'no. of char u wanted to scan=$'
str1 db 100 dup (?)
str2 db 100 dup (?)
var dw 0
var1 dw 0
var2 dw 0
var3 dw 0
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	lea di,str1
	cld
	xor cx,cx
	mov ah,1
top_:	
	int 21h
	cmp al,0dh
	je end_
	stosb
	inc cx
	jmp top_
end_:
	
	mov var,cx
	mov var1,cx

	lea si,str1
again:	lodsb
	xor bx,bx
	lea di,str1
	cld
	mov cx,var1
scan:
	scasb
	jne level
	inc bx
level:	dec cx
	cmp cx,0
	jne scan

lea di,str2
;cld
scasb

dec var3
cmp var3,0
je ann
mov dl,al
mov ah,2
int 21h

;cld
stosb

inc var2
mov ax,var2
mov var3,ax
mov ah,2
mov dl,'='
int 21h
mov dl,bl
add dl,48
mov ah,2
int 21h	
ann:
dec var
cmp var,0
jne again

mov ah,4ch
int 21h
main endp
end main	
	
	