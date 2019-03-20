org 100h
include 'emu8086.inc'
.model small
.DATA
    ARR1 DB 1,2,3,4
    ARR2 DB 4,3,2,1
    ARR3 DB ?,?,?,?
.CODE 
   MOV AX,@DATA
   MOV DS,AX
   MOV SI,0
   MOV AX,0
  START: 
   CMP SI,4
   JE END
   MOV AL,ARR1[SI]
   add AL,ARR2[SI]
   MOV arr3[SI],AL
   CALL PRINT_NUM 
   PRINT 20H   
   INC SI
   JMP START 
   END:   
      PRINT 0AH
      PRINT 'COMPLETED'  
   ret
     DEFINE_PRINT_NUM
     DEFINE_PRINT_NUM_UNS