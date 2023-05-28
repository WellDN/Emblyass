; create a file named myfile.txt, and writes a text "Saa". Next, the program reads the file and store data into a buffer named info. it displays
; the text as stored in info.

section     .text
    global      _start

_start:
    ; create the file
    mov     eax, 8
    mov     ebx, file_name
    mov     ecx, 0777       ; Read and execute all
    int     0x80

    mov     [fd_out], eax

    ; Write into the file

    mov     edx, len
    mov     ecx, msg
    mov     ebx, [fd_out]   ; File descriptor
    mov     eax, 4
    int     0x80

    ; Close file

    mov     eax, 6
    mov     ebx, [fd_out]

    ; Write the message indicating end of file write

    mov     eax, 4
    mov     ebx, file_name
    mov     ecx, 0          ; For read only access
    mov     edx, 0777       ; Read, write and execute by all
    int     0x80

    mov     [fd_in], eax

    ; Read from file
    mov     eax, 3
    mov     ebx, [fd_in]
    mov     ecx, info
    mov     edx, 26
    int     0x80

    ; Close the file
    
    mov     eax, 6
    mov     ebx, [fd_in]

    ; Print the info

    mov     eax, 4
    mov     ebx, 1
    mov     ecx, info
    mov     edx, 26
    int     0x80

    mov     eax, 1
    int     0x80

section     .data
    file_name   db 'myfile.txt'
    msg         db 'Saa'
    len         equ $-msg
    
    msg_done    db 'Written to file', 0xa
    len_done    equ $-msg_done

section     .bss
    fd_out      resb 1
    fd_in       resb 1
    info        resb 26

