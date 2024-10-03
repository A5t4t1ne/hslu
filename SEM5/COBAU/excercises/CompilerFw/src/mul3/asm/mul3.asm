; import the required external symbols for the system call functions
extern _read
extern _write
extern _exit

; export entry point
global _start

section .data:
	INP_MSG db "Please enter a number: "
    INP_MSG_LEN equ $ - INP_MSG
	NEWLINE db 10					; Define a newline character (ASCII 10)

section .bss ; uninitialized data
	LENGTH EQU 64
	alignb 8 ; align to 8 bytes (for 64-bit machine)
	NUM resb LENGTH ; buffer (64 bytes
	buffer resb LENGTH  ; Buffer to hold the string representation


section .text
; implement multiplication by 3 (milestone 1)

_start:
	; print prompt and read number
	mov rdi, INP_MSG 
	mov rsi, INP_MSG_LEN 
	call _write 

	mov rdi, NUM 
	mov rsi, LENGTH
	call _read

	mov r13, 0 ; character offset  
	
for_loop:
	; (tmp) write character one by one
	mov r12, NUM
	add r12, r13
	test r12, r12 
	jz _exit

	sub r12, 48 ; convert ASCII character to number 

	mov r15, 1
	mov r14, 1

start_factor_loop:
	mov r11, r13 
	inc r11 
	cmp r14, r11 
	jge end_factor_loop

	imul r15, 10
	inc r14

end_factor_loop:

	; mov rdi, rax 
	; add rdi, 48
	; mov rsi, 1 
	; call _write 
 
	; imul rax, r12 ; multiply by decimal factor to recreate the number

	; mov eax, 12345       ; Number to print
	mov rax, r15
    
    ; Convert number to string
    mov ecx, 10
    mov edi, buffer
    add edi, LENGTH          ; Start at end of buffer
	dec edi 


.convert_loop:
    xor edx, edx
    div ecx              ; Divide by 10
    add dl, '0'          ; Convert remainder to ASCII
    dec edi
    mov [edi], dl        ; Store digit
    test eax, eax
    jnz .convert_loop
    
    ; Calculate length of string
    mov edx, buffer
    add edx, 20
    sub edx, edi         ; EDX now contains length
    
    ; Write number to stdout
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, edi         ; Address of string
    int 0x80

	mov rdi, buffer
	mov rsi, 1 
	call _write 


	; end convert and print


	add r12, 48   ; convert number to ASCII character
	
;	mov rdi, r12
;	mov rsi, 1 
;	call _write 

	mov rdi, NEWLINE
	mov rsi, 1 
	call _write

	add r13, 1 ; increment counter
	
	; check for 0-term
	mov al, 0
	cmp [NUM + r13 + 1], al 
	jne for_loop


; exit program with exit code 0
exit:       mov   rdi, 0                ; first parameter: set exit code
            call  _exit                 ; call function
