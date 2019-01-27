.model small
.stack 100h
.data 
var db '?'
A db 10,8,30,11
.code
main proc
	mov ax,@data
	mov ds,ax

	mov bl,[si]
	mov cx,4
	lea si,A
top:	mov al,[si]
	cmp al,bl
	jl NEXT
	jmp LEVEL
NEXT:	mov bl,al
LEVEL:	inc si
	loop top
la:	mov al,bl
	mov ah,0
	call printd
mov ah,4ch
int 21h

printd  proc
	
    
    push    ax
    push    bx
    push    cx
    push    dx
  
    mov     dx, 0
    mov     cx, 10
    div     cx

   
    cmp     ax, 0
    jne     L2

  
    add     dl, '0'
    mov     ah, 2
    int     21h

    jmp     L3

L2:
   
    call    printd             

   
    add     dl, '0'
    mov     ah, 2
    int     21h        

L3:
   
    pop     dx
    pop     cx
    pop     bx
    pop     ax
    ret
printd  endp
	
	
	

main endp
end main