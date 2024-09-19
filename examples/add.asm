section .data
    num1 dq 5           ; First number
    num2 dq 10          ; Second number
    result dq 0         ; Variable to store the result

section .text
    global _start

_start:
    ; Load num1 into rax
    mov rax, [num1]
    
    ; Add num2 to rax
    add rax, [num2]
    
    ; Store the result
    mov [result], rax
    
    ; Exit the program
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status: 0
    syscall
