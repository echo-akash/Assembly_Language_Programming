.model small
.stack 100h
.data
  w dw 100 dup(0)
  var dw 0
.code
main proc 

    mov ax,@data
    mov ds,ax
    lea si,w
    
 strt:  
     xor bx,bx
     xor ax,ax
 while_:


    mov ah,1
    int 21h
    cmp al,0dh
    je nxt
    cmp al,20h
    je lvl
    and ax,000Fh
    push ax
    mov ax,10
    mul bx
    pop bx
    add bx,ax
    jmp while_
lvl:

    mov ax,bx   
    mov [si],ax
    inc var
    add si,2
    jmp strt
nxt:   

	mov ax,bx   
     	mov [si],ax
	inc var
	mov ah,2
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h

	mov bx,var
	lea si,w
	dec bx
	mov cx,bx
	mov dx,si
top:
	mov si,dx
	mov cx,bx
	mov di,si
	mov ax,[di]
	
toop:
	add si,2
	cmp [si],ax
	jng @nxt
	mov di,si
	mov ax,[di]
@nxt:
	
	loop toop
	push ax
	mov ax,[si]
	xchg ax,[di]
	mov [si],ax
	pop ax
	dec bx
	jne top
	;output
endsort:	
	lea di,w
	
l2:
    mov ax,[di]
    xor cx,cx
    mov bx,10
top_:
    xor dx,dx
    div bx
    push dx
    inc cx
    or ax,ax
    jne top_
    mov ah,2
l1:
    pop dx
    add dl,48
    int 21h
    loop l1
    mov ah,2
    mov dl,' '
    int 21h
    add di,2
    dec var
    cmp var,0
    jne l2
    mov ah,4ch
    int 21h
main  endp
end main