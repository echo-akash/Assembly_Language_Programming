.model small
.stack 100h
.data

st1 db 'hzzzzz$'
st2 db 'hello$'
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea si,st1
	lea di,st2
	
	cmpsb
	rep cmpsb
	jl first
	jg last
	mov ax,0
	mov dx,ax
	add dx,48
	mov ah,2
	int 21h
	jmp exit
first:
	mov ax,1
	mov dx,ax
	add dx,48
	mov ah,2
	int 21h
	jmp exit
last:
	mov ax,2
	mov dx,ax
	add dx,48
	mov ah,2
	int 21h
	jmp exit
	
exit:
	mov ah,4ch
	int 21h
main endp
end main