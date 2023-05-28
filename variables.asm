; DB -> define byte -> 1 byte
; DW -> define word -> 2 bytes
; DD -> define Doubleword -> 4 bytes
; DQ -> define quadword -> 8 bytes
; DT -> define Ten Bytes -> 10 bytes

choice      DB 'y'
number      DW 12345
neg_number  DW -12345
big_number  DQ 123456789
real_number1    DD 1.234
real_number2    DQ 123.456
