; push/pop

; Save the AX and BX registers in the stack

; PUSH    AX
; PUSH    BX

; Save the registers for other purpose

; MOV     AX, VALUE1
; MOV     BX, VALUE2

; MOV     VALUE1, AX
; MOV     VALUE2, BX

; Restore the original values

; POP     AX
; POP     BX

; it displays the entire ascii character sets: 

section     .text
    global  _start

_start:
    call    display
    mov     eax, 1
    int     0x80

display:
    mov     ecx, 256

next:
    push    ecx
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, achar
    mov     edx, 1
    int     80h

    pop     ecx
    mov     dx, [achar]
    cmp     byte [achar], 0dh
    inc     byte [achar]
    loop    next
    ret

section     .data
    achar   db '0'

; 0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}
