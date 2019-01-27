.model	small
.stack	100h
.data
msg	db	0dh,0ah,'Enter  First string  : ',0dh,0ah,'$'
msg1	db	0dh,0ah,'Enter Second String :  ',0dh,0ah,'$'
msg2	db	0dh,0ah,'Yes substirng  ',0dh,0ah,'$'
msg3	db 	0dh,0ah,'NOt  substring ',0dh,0ah,'$'
count1	dw	?
count2	dw	?

string1	db 	10 dup (?)
string2	db	10 dup (?)

.code
main	proc 
	mov	ax , @data
	mov	ds , ax
	mov	es , ax
	mov	bl , 0
	mov	bx , 0
	mov	cx , 0
	
; input first string 
	lea	dx ,msg
	mov	ah , 9
	int 	21h
	
	lea	di , string1
	cld
top:
	mov	ah , 1
	int 	21h

	cmp	al , 0dh
	je	exit_top
	
	inc	bl  	; bl contains the number of character
	stosb
	jmp	top

exit_top:
	mov	count1 , bx
	mov	bx , 0

;input second string 
	lea	dx ,msg1
	mov	ah , 9
	int 	21h

	lea	di , string2
	cld
top1:
	mov	ah , 1
	int 	21h

	cmp	al , 0dh
	je	exit_top1
	
	inc	bl  	; bl contains the number of character
	stosb
	jmp	top1
exit_top1:
	mov	count2 , bx

;;;;;;;;;;;
;checking for sub string 
	mov	bx , 0
	mov	cx , 0
	lea	di , string1
	lea	si , string2
	cld
	
looop:	
	cmp	cx , count1
	je	no
	mov 	al , [si]
	mov	dl , [di]
	scasb
	cmp	al , dl
	je	found
	jne	notfound
found:
	add	si , 1
	add	bl , 1
	add	cl , 1
	cmp	bx , count2
	je	yes
	jmp	looop
notfound:
	lea	si , string2
	add	cl , 1
	jmp	looop
	

no:
	lea	dx , msg3
	mov	ah , 9
	int 	21h
	jmp	dos_exit
	
	

yes:	
	lea	dx , msg2
	mov	ah , 9
	int 	21h
	
		
;;;;;;;;;;
;dos exit	
dos_exit:
	
	mov	ah , 4ch
	int 	21h
	
main	endp
end	main