 CMP     DX, 00 ; Compare the DX value with zero
 JE      L7     ; If yes, then jump to label L7

 L7:...

; reached number of a loop

 INC    EDX
 CMP    EDX, 10 ; Compares wheter the counter has reached 10
 JLE    LP1     ; If it is less than or equal to 10, then jump to LP1
