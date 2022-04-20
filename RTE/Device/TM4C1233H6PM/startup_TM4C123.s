  THUMB   ; Marks the THUMB mode of operation 
StackSize EQU 0x00000100 ; Define stack size of 256 bytes 
  AREA STACK, NOINIT, READWRITE, ALIGN=3  
MyStackMem SPACE StackSize 
  AREA RESET, READONLY 
  EXPORT  __Vectors 
__Vectors 
  DCD MyStackMem + StackSize ; stack pointer for empty stack: 0x2000.0100 
  DCD Reset_Handler  ; reset vector 0x0000.0008-0009 
  AREA MYCODE, CODE, READONLY 
  ENTRY 
  EXPORT  Reset_Handler 
Reset_Handler 
;  MOV R0, #100   
 ; MUL R2, R1, R0
 		MOV		R0, #0 ;set R0 to 0
		ADD		R3, R0, R1, LSL #2 ;R3 = 0 + R1 * 4 = 4 * R1
		MOV		R4, R3 ;set R3 to R4
		ADD		R4, R3, R1, LSL #5 ; R4 = R3 + R1 * 32 = 4 * R1 + 32 * R1 = 36 * R1
		MOV		R2, R4 ;set R2 to R4
		ADD		R2, R4, R1, LSL #6 ;R2 = R4 + R1 * 64 = 36 * R1 + 64 * R1 = R1 * 100
  END 