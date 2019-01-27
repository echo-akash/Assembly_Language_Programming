.model small
.stack 100h
.data
msg db 'Do u want to continue?$'
error db 'Wrong$'
msg1 db '1$'
.code
main proc

	mov ax,@data
	mov ds,ax
TOP:
	
	lea dx,msg
	mov ah,9
	int 21h
	mov ah,1
	int 21h
	cmp al,'y'
	je Yes
	cmp al,"Y"
	je Yes
	cmp al,'N'
	je No
	cmp al,"n"
	je No

Yes:
	mov ah,1
	int 21h
	cmp al,'A'
	jge Letter
	jmp digit_
Letter:
	
	cmp al,'F'
	jle l1
	jmp er_
l1:	
	sub al,17
	mov bl,al
	lea dx,msg1
	mov ah,9
	int 21h
	mov dl,bl
	mov ah,2
	int 21h
	jmp TOP

digit_:
	cmp al,0
	jge l2
	cmp al,9
	jle l2
	jmp TOP
l2:	mov dl,al
	mov ah,2
	int 21h
	jmp TOP
er_:
	
	lea dx,error
	mov ah,9
	int 21h
	jmp TOP
	
No:
	jmp exit
exit:
	mov ah,4ch
	int 21h
	
	
	
	

 
main endp
end main