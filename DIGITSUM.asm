org 100h
include 'emu8086.inc'
.model small                       
.code
  mov Ax,0
  mov bh,10
  mov bl,0 
  mov cx,0
  call scan_num
  START:
      CMP cl,0 
      JE END
      mov ax,cx
      idiv bh 
      add bl,ah
      mov cl,al
      jmp START
      END: 
         mov ah,0
         mov al,bl  
         print 'sum is '
         print 20h
         call PRINT_NUM
      ret
          DEFINE_PRINT_NUM
          DEFINE_PRINT_NUM_UNS
          DEFINE_SCAN_NUM
   