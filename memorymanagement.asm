; 16kb of memory using sys_brk system call

section     .text
    global  _start

_start:
    mov     eax, 45     ; sys_brk
    xor     ebx, ebx
    int     80h

    add     eax, 16384
    mov     ebx, eax
    mov     eax, 45     ; sys_brk
    int     80h
    
    cmp     eax, 0
    jl      exit        ; Exit if error
    mov     edi, eax    ; EDI = highest available address
    sub     edi, 4      ; pointing to the las DWORD
    mov     ecx, 4096   ; number of DWORDs allocated
    xor     eax, eax    ; clear eax
    std                 ; backward
    rep     stosd       ; repete for entire allocated area
    cld                 ; put DF flag to normal state
    
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, msg
    mov     edx, len 
    int     0x80

exit:
    mov     eax, 1
    xor     ebx, ebx 
    int     80h

section     .data
    msg     db 'Allocated 16 kb of memory!', 10
    len     equ $ - msg
    
