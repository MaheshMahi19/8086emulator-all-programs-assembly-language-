org 100h
include 'emu8086.inc'
.model small
.data
  arr db 11,12,13,14,15
.code 
   mov ax,@data
   mov ds,ax
   mov bx,0
   mov ax,0
   mov si,0
   mov cx,2 
start:
    cmp si,5
    je end
    mov al,arr[si]
    idiv cl
    cmp ah,0
    je even
    jmp odd
even:
    mov ax,0
    mov al,arr[si]
    call print_num
    print 'is even'
    print 3Bh
    print 20h
    inc si
    jmp start
odd:  
    mov ax,0
    mov al,arr[si]
    call print_num
    print 20h
    print 'is odd'
    print 3Bh  
    print 20h
    inc si   
    jmp start
end:                
   print 0ah
   print 'completed'
   ret
    define_print_num
    define_print_num_uns     
    
     
    
    