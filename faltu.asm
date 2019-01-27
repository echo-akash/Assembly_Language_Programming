.MODEL SMALL
.STACK 100H
.DATA
        FIVE DW 5
        SCORES DW 1,1,1,10
               DW 2,2,2,20
               DW 3,3,3,3
               DW 4,4,4,4
               DW 5,5,5,5
        AVG    DW 4 DUP(?)

.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX

        MOV SI,6
REPEAT:
        MOV CX,5
        XOR BX,BX
        XOR AX,AX

FOR:
        ADD AX,SCORES[BX+SI]
        ADD BX,8
        LOOP FOR

        XOR DX,DX
        DIV FIVE
        MOV AVG[SI],AX
        SUB SI,2
        JNL REPEAT

        MOV CX,4
        MOV SI,0

        FOR_:
             
             MOV DX,AVG[SI]
             add dx,30h
             MOV AH,2
             INT 21H
             ADD SI,2
             LOOP FOR_


        MOV AH,4CH
        INT 21H

        MAIN ENDP
        END MAIN
