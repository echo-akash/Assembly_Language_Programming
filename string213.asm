.model small
.stack 100h
.data

msg db 100 dup(0)
newline db 0dh,0ah,'$'

.code

main proc

    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea di,msg
    cld
    xor bx,bx
    mov ah,1
    int 21h


input:
    
    cmp al,0dh
    je output
    cmp al,8h
    jne store
    dec di
    dec bx
    jmp again
    
store:

    stosb
    inc bx
    
again:

    int 21h
    jmp input
    
    
output:


    lea dx,newline
    mov ah,9
    int 21h
    
    lea si,msg
    mov cx,10
    mov ah,2
    
for:

    lodsb
    mov dl,al
    int 21h
    loop for
    
exit:

    mov ah,4ch
    int 21h
    
main endp
end main
    
