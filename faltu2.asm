
.model small
.stack 100h
.data
four dw 4
scores dw 7,4,3,9
dw 7,5,9,3
dw 2,9,3,8
dw 4,10,8,9
dw 7,9,4,7

.code
main proc
mov ax,@data
mov ds,ax

mov bx,0
mov cx,5

again_:
xor ax,ax
mov si,0

sum_:
add ax,scores[BX+SI]
add si,2
cmp si,6
jge sum_
jmp display_

display_:
xor dx,dx
div four
mov dx,ax
add dx,30h
mov ah,2
int 21h

add bx,8
loop again_

mov ah,4ch
int 21h


main endp
end main