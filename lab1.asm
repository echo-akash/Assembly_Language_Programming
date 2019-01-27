.model small
.stack 100h
.data
ymsg db 0dh,0ah,'do you want to give input again?$'
msg2 db 0dh,0ah,'give input:$'
msg3 db 0dh,0ah,'hexa output:$'
msg4 db 0dh,0ah,'wrong input$'
.code
main proc
	mov ax,@data
	mov ds,ax
input:	
	lea dx,msg2
	mov ah,9
	int 21h
	mov ah,1
	int 21h
	mov bl,al
	
	cmp al,65
	jl next_
	
	
	cmp al,70
	jle outt

next_:
	lea dx,msg4
	mov ah,9
	int 21h
	jmp next
	
outt:
	lea dx,msg3
	mov ah,9
	int 21h
	mov dl,'1'
	mov ah,2
	int 21h
	jmp again
	
again:	
	mov dl,bl
	sub dl,17
	mov ah,2
	int 21h
	
next:
	lea dx,ymsg
	mov ah,9
	int 21h
	mov ah,1
	int 21h
	cmp al,'y'
	je input
	cmp al,'n'
	je exit
	
	
exit:	
mov ah,4ch
int 21h

main endp
end main
	
