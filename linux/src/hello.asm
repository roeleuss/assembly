global _start

section .data
message: db 'hello, world!', 10

section .text 
_start:
    mov     rax, 1          ; o número da chamada de sistema deve ser armazenado em rax     número da syscall 'write'
    mov     rdi, 1          ; argumento #1 em rdi: onde escrever (descritor)?               descritor de stdout
    mov     rsi, message    ; argumento #2 em rsi: onde começa a string?                    endereço da string
    mov     rdx, 14         ; argumento #3 em rdx: quantos bytes devem ser escritos?        tamanho da string em bytes
    syscall                 ; essa instrução faz uma chamada de sistema

    mov     rax, 60         ; número da syscall 'exit'
    xor     rdi, rdi
    syscall