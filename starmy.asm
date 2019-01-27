.model small
.stack 100h
.data
i db '?'
var db '?'
.code
 main proc
	mov ax,@data
	mov ds,ax
	
	mov ah,1
	int 21h
	sub al,48
	
	mov ch,0
	mov cl,al
	mov var,0
	mov bl,al	;j
	mov bh,1	;k
	mov i,1
	mov ah,2
top:
	dec bl		;j=al-1
	inc i
	inc var		;i++
	cmp bl,0	;j>0
	jg l1
	jmp f
l1:	mov dl,' '
	dec bl		;j--
	mov ah,2
	int 21h
	cmp bl,0
	jg l1
f:	mov dl,'*'
	cmp bh,i
	jle f1
	jmp new
f1:
	mov ah,2
	int 21h
	inc bh
	
	cmp bh,var
	jle f1
new:
	mov dl,0ah
	int 21h
	loop top
	

	mov ah,4ch
	int 21h
	
	

 main endp
end main