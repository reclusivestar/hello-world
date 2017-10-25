.ORIG x3000
START AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0

LD R2, TRAPLOC
STI R2, TRAP26
LD R3, ISRLOC
STI R3, ISR
LD R6, STACK
LOOP TRAP x26 ; get char
TRAP x21 ; print char to screen
TRAP x26 ; get char
TRAP x21 ; print char to screen
TRAP x26 ; get char
TRAP x21 ; print char to screen
TRAP x26 ; get char
TRAP x21 ; print char to screen
TRAP x26 ; get char
TRAP x21 ; print char to screen
LEA R0, END_MSG
PUTS
BRnzp LOOP
END_MSG .STRINGZ "\nSuccess! Running again...\n"

TRAP26 .FILL x0026
TRAPLOC .FILL x3300
ISRLOC .FILL x3500
ISR .FILL x0180 ;location of keyboard interrupt vector
STACK .FILL x3000
BRnzp START
.END