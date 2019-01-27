.model small
.stack 100h
.data
msg db 'type a char:$'
msg1 db 0dh,0ah,'ascii in binary:$'
msg2 db 0dh,0ah,'no. of 1 in bits:$'
var db 0
.code
main proc
	mov ax,@data
	mov ds,ax
	lea dx,msg
	mov ah,9
	int 21h

	mov ah,1
	int 21h
	mov bl,al
	lea dx,msg1
	mov ah,9
	int 21h
	
	mov cl,8
top:	rol bl,1
	jc top1
	mov dl,'0'
	jmp out_
top1:
	mov dl,'1'
	inc var
out_:
	mov ah,2
	int 21h
	loop top
	
	lea dx,msg2
	mov ah,9
	int 21h
	mov dl,var
	add dl,48
	mov ah,2
	int 21h
mov ah,4ch
int 21h
main endp
end main