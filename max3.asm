.model small
.stack 100h
.data
 msg db 0dh,0ah,'max:$'
 var db '?'
 var1 db '?'
 .code
 main proc
 mov ax,@data
 mov ds,ax
 mov var1,0
 mov ah,1
 int 21h
 mov bl,al
 mov ah,1
 int 21h
 mov var1,al
 mov ah,1
 int 21h
 mov var,0
 cmp bl,var1
 jg next
 mov dl,var1
 mov var,dl
 jmp level
 next:
 mov var,bl
 level:
 cmp var,al
 jg next_
 mov var,al
 
 next_:
 lea dx,msg
 mov ah,9
 int 21h
 mov dl,var
 mov ah,2
 int 21h
 
 mov ah,4ch
 int 21h
 
 main endp 
 end main