

.model small
.stack 100h
.data

s1 db 13,10,'Maximum $'
s2 db 13,10,'Minimum $'
s3 db 13,10,'input:: 075417398 $'

array  db 0,7,5,4,1,7,3,9,8

max db 0
min db 0

.code

main proc

mov ax,@data
mov ds,ax

mov dx,offset s3
mov ah,9
int 21h


mov si,offset array
mov dl,[si]
mov max,dl
mov min,dl


mov cx,9
xyz:

inc si
mov dl,[si]

cmp max,dl
jl l1

cmp min,dl
jg l2

jmp k1

l1:
mov max,dl
jmp k1

l2:
mov min,dl

k1:
loop xyz


mov dx,offset s1
mov ah,9
int 21h

mov bl,max
mov cx,0
mov dl,10

l3:
mov ah,0
mov al,bl
div dl
mov bl,al
mov al,ah
mov ah,0
push ax
inc cx
cmp bl,0
jnz l3

l4:
pop ax
mov ah,2
mov dl,al
add dl,48
int 21h
loop l4




mov dx,offset s2
mov ah,9
int 21h

mov bl,min
mov cx,0
mov dl,10

l5:
mov ah,0
mov al,bl
div dl
mov bl,al
mov al,ah
mov ah,0
push ax
inc cx
cmp bl,0
jnz l5

l6:
pop ax
mov ah,2
mov dl,al
add dl,48
int 21h
loop l6


mov ah,4ch
int 21h

main endp
end main
