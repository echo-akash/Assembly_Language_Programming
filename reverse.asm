.model small
.stack 100h
.data
msg db 100 dup(0)
var dw 0
var1 dw 0
.code

main proc

    mov ax,@data
    mov ds,ax
    mov es,ax
    
    
    lea di,msg
    cld
    xor bx,bx
input:

    mov ah,1
    int 21h
    
    cmp al,0dh
    je newline
    
    cmp al,8h
    jne else
    
    dec di
    dec bx
    
else:

    stosb
    inc bx
    jmp input
    
newline:
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
reverse:

    
    lea si,msg
    mov cx,3
rev:

    mov var,si
    lodsb
    xchg al,[di]
    dec di
    push di
    push si
    mov di,var
    stosb
    pop si
    pop di
    loop rev
    
    

    
    
    lea si,msg
    mov cx,bx
output:

    
    lodsb
    mov dl,al
    int 21h
    loop output
    
exit:

    mov ah,4ch
    int 21h
    
    
main endp
end main
    
    
    