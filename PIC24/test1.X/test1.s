; The following code will be placed in the executable
; code section.
.text
.global __reset
__reset:
LOOP:
    mov     0x1020, w1  ;INW0=aaab
    mov     0x1022, w2  ;INW1=5555
    add     w1,w2,w3    
    sub     w1,w2,w4    
    and     w1,w2,w5    
    ior     w1,w2,w6    
    mov     w1, 0x1024
    mov     w2, 0x1024
    mov     w3, 0x1024
    mov     w4, 0x1024
    mov     w5, 0x1024
    mov     w6, 0x1024
    bra     LOOP
.end

