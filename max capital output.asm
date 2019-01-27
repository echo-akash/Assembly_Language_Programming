.model small
.stack 100h
.data
msg db 'No capitals $'
msg1 db 'First Capitals ='
First db '['
msg2 db 'last Capitals ='
last db '@ $'
msg3 db 0ah,0dh ,'$'

.code
 main proc
	
	mov ax,@data
	mov ds,ax

	mov ah,1
	int 21h

while_:
	cmp al,0dh
	je end_while
	cmp al,'A'
	jnge end_if
	cmp al,'Z'
	jnle end_if


	cmp al, First
	jnl c_last
	mov First,al
c_last:
	cmp al, last
	jng end_if
	mov last,al

end_if:
	int 21h
	jmp while_
end_while:
	
	lea dx,msg3
	mov ah,9
	int 21h
	mov ah,2
	mov dl,First
	int 21h

	mov ah,2
	mov dl,last
	int 21h

	mov ah,4ch
	int 21h
	
 main endp
end main