org 100h
include 'emu8086.inc'
.MODEL SMALL
.DATA
    ARR DB 1,3,4,5,7
.CODE
    CALL SCAN_NUM
    MOV AX,@DATA
    MOV DS,AX
    MOV SI,0 ;TO STORE MIDDLE INDEX
    MOV CH,2 ;WHILE CALCULATING MID VALUE WE USE THIS DI
    MOV BX,0 ;FIRST INDEX
    MOV DX,4 ;LAST INDEX-1  
    JMP MID_CALC
START:
    CMP BX,DX
    JG END
    CMP CL,ARR[SI]
    JE EXIT              
    CMP CL,ARR[SI]  ; SERACH > ARR [MID]
    JA FUN1
    CMP ARR[SI],CL  ; ARR [MID] > SEARCH
    JA FUN2
    JMP START   
FUN1:
    MOV BX,SI
    INC BX
    JMP MID_CALC
    
FUN2:
    MOV DX,SI
    DEC DX
    JMP MID_CALC

MID_CALC:
    MOV AX,0
    MOV AX,BX
    ADD AX,DX
    IDIV CH 
    MOV AH,0
    MOV SI,AX
    JMP START
END:
    PRINT 'NOT FOUND'
    JMP GO
EXIT:
    PRINT 'FOUND'
GO:
    ret 
        DEFINE_PRINT_NUM
        DEFINE_PRINT_NUM_UNS
        DEFINE_SCAN_NUM
    
    