.model small
.stack 100h
.data
msg db 100 dup(0)
var db 0

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
    
    mov ah,1
    int 21h
    
    mov cx,bx
    lea di,msg
count:

    scasb
    je incc
    jne cnt
incc:
     inc var
cnt:
    loop count
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    mov dl,var
    add dl,48
    mov ah,2
    int 21h
    
exit:

    mov ah,4ch
    int 21h
    
main endp
end main