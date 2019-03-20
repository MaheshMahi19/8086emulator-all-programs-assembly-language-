org 100h
include 'emu8086.inc'
.model small
.data
  ARR db 1,2,3,4,5,6,7
.code
  mov AX,@data
  mov DS,AX
  mov  SI,0
  mov AX,0
  CALL SCAN_NUM
  mov AL,CL
  START:
      CMP SI,7
      JE END
      CMP ARR[SI],AL
      JE EXIT
      INC SI
      JMP START
      END:
         PRINT 'NOT FOUND'
         JMP GO
      EXIT:
         PRINT 'FOUND'
         JMP GO
         GO:
        ret
          DEFINE_PRINT_NUM
          DEFINE_PRINT_NUM_UNS
          DEFINE_SCAN_NUM
   