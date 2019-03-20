org 100h
include 'emu8086.inc'
.model small
.code 
   MOV ax,25
   MOV bl,50
start:
   cmp bl,0
   je exit
   mov cl,bl
   idiv bl
   mov bl,ah
   mov ax,cx
   jmp start
   exit:
      call print_num
ret
  DEFINE_PRINT_NUM
  DEFINE_PRINT_NUM_UNS
