org 100h
include 'emu8086.inc'
.model small
.DATA
arr db 4,1,1,16,8
.CODE
mov AX,@DATA
mov DS,AX
mov SI,0
mov AX,0
mov AL,arr[SI]
start:
    CMP SI,5
    JE END
    CMP arr[SI],AL
    JB  NEXT
    Inc SI
    JMP START 
    NEXT:
      MOV AL,arr[SI]
      INC SI
      JMP START
    END:
      CALL PRINT_NUM
      ret
      DEFINE_PRINT_NUM
      DEFINE_PRINT_num_UNS
    
             