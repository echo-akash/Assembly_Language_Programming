.model small
.stack 100h
.data

msg db 100 dup(0)
var dw 0

.code

main proc

    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea di,msg
    cld
input1:

    xor bx,bx
        
input:
    inc var
    mov ah,1
    int 21h
    cmp al,0dh
    je pop_2
    cmp al,' '
    je pop_1
    
    mov ah,0
    push ax
    inc bx
    jmp input
    
pop_1:

    mov cx,bx
  

pop_:
    pop ax
    stosb 
    loop pop_
    
    mov al,' '
    stosb
    jmp input1
    
pop_2:

    mov cx,bx
  

popp_:
    pop ax
    stosb 
    loop popp_
    
    
    
output:
    lea si,msg
    mov cx,var
    cld


    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
output1:
    lodsb
    mov dl,al
    int 21h
    loop output1
    
    
    
exit:

    mov ah,4ch
    int 21h
    
    
main endp
end main
    
    
    