; months

; MONTHS      DW 12
; MONTHS      DW 0CH
; MONTHS      DW 0110B
;
; one-dimensional
;
; NUMBERS     DW 34, 45, 56, 77, 88, 9
;
; inventory of size 8
;
; INVENTORY   DW 0
;            DW 0
;            DW 0
;            DW 0
;            DW 0
;            DW 0
;            DW 0
;            DW 0

; which can be abreviated by:

; INVENTORY   DW 0, 0, 0, 0, 0, 0, 0, 0

; or

; INVENTORY   TIMES 8 DW 0


; This define array of a 3 element array x, which stores three values 2, 3 and 4 and sum them up

section     .text
    global  _start

_start:
    mov     eax, 3 ; Number bytes to be summed
    mov     ebx, 0 ; EBX will store the sum
    mov     ecx, x ; ECX will point to the current element to be summed

top: add ebx, [ecx]
    add     ecx, 1 ; Move pointer to the next element
    dec     eax    ; Decrement counter
    jnz     top    ; If counter not 0, then loop again

done: 
    add     ebx, '0'
    mov     [sum], ebx ; Done, store default in "sum"

display:
    mov     edx, 1      ; Message length
    mov     ecx, sum    ; Message to write
    mov     ebx, 1      ; File descriptor (stdout)
    mov     eax, 4      ; System call number (sys_write)
    int     0x80        ; Call kernel

    mov     eax, 1      ; System call number (sys_exit)
    int     0x80

section     .data
    global      x
x:
    db      2
    db      4
    db      3

sum:
    db      0
    
