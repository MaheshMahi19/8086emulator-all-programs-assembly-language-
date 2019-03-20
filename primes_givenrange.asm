org 100h
include 'emu8086.inc'
.model small
.data                    
arr db 5,50
.code 
  mov ax,@data
  mov ds,ax
  mov ax,0 
  print 'primes in given range are :'
  start:   
     mov al,arr[0]
     cmp al,arr[1]
     je final
     mov al,arr[0]
     mov bx,ax
     mov cx,ax
     mov si,0
     jmp calc
     calc:
     cmp si,1
     ja go
     mov ax,cx   
     idiv bl 
     dec bx
     cmp bx,0
     je end
     cmp ah,0 
     je factinc
     jmp calc
     factinc:
        inc si
        jmp calc 
        
     end:
       mov ax,cx 
       cmp si,1
       je prime
       ;print 'is not a prime number'
       jmp go
       prime:
       call print_num
       print 20h              
        ;print 'is a prime number'
      go:    
         inc arr[0]
         jmp start
         
      final:            
         print 0ah
         print 'Completed' 
         
       ret
       define_print_num
       define_print_num_uns