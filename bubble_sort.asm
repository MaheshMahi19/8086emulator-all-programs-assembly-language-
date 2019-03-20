org 100h
include 'emu8086.inc'
.model small
.data
arr db 6,0,2,4
.code 
  mov ax,@data
  mov ds,ax
  mov ax,0
  mov bx,0
  mov cx,0
outer:
    mov si,0
    cmp bl,4
    jl innerfor
    jmp exit
innerfor:
      cmp si,3
      jl ininfor      
      inc bl 
      jmp outer

ininfor:
      mov di,si
      inc di
      jmp inif
    
inif:
      mov al,arr[si]   
      cmp al,arr[di]
      ja swapper
      inc si
      jmp innerfor        

swapper:
    mov cl,arr[di]
    mov arr[si],cl
    mov arr[di],al 
    inc si
    jmp innerfor

exit:                       
     mov si,0
     printer:
        cmp si,4
        je end
        mov al,arr[si]
        call print_num
        print 20h
        inc si
        jmp printer
end:
    print 20h
    print 'sorted'
      ret 
      define_print_num
      define_print_num_uns
                  
    
    
    
    
    
 