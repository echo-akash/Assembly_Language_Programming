.model small
.stack 100h
.data
correct db 'correct expression$'
mismatch db 'do not match$'
right db 'too many right bracket$'
continue db 'contunye?$'
left db 'too many left brackets$'
.code
 main proc

	mov ax,@data
	mov ds,ax
	xor cx,cx

while_:
	
	mov ah,1
	int 21h
	cmp al,0dh
	je end_
	

	cmp al,'('
	je pushbr

	cmp al,'{'
	je pushbr
	
	cmp al,'['
	je pushbr
	
	cmp al,')'
	je round

	cmp al,'}'
	je curly

	cmp al,']'
	je square

	
	jmp while_
pushbr:
	mov ah,0
	push ax
	inc cx
	jmp while_

round:
	pop dx
	dec cx
	cmp cx,0
	jl @right

	cmp dx,'('
	jne @mismatch

	jmp while_
curly:
	pop dx
	dec cx
	cmp cx,0
	jl @right
	
	
	cmp dx,'{'
	jne @mismatch

	jmp while_
square:
	pop dx
	dec cx
	cmp cx,0
	jl @right
	
	
	cmp dx,'['
	jne @mismatch

	jmp while_
@right:
	mov ah,9
	lea dx,right
	int 21h
	jmp exit
@mismatch:
	mov ah,9
	lea dx,mismatch
	int 21h
	jmp exit
end_:
	;mov ah,9
	cmp cx,0
	jne left_
	mov ah,9
	lea dx,correct
	int 21h
	jmp exit
left_:
	mov ah,9
	lea dx,left
	int 21h
	

exit:	

	mov ah,4ch
	int 21h

	
 main endp
end main