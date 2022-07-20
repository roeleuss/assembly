global _start

section .data
codes: db '0123456789ABCDEF'


section .text
_start:
    mov rax, 0x1122334455667788
    mov rdi, 1
    mov rdx, 1
    mov rcx, 64

; cada 4 bits devem ser exibidos como um digito hexadecimal
; use o deslocamento (shift) e a operação bit a bit AND para isolá-los
; o resultado é o offset no array 'codes'
.loop:
    push rax        ; guarda rax na pilha
    sub rcx, 4      ; subtrai 4 de rcx

    ; cl é um registrador, a parte menor de rcx
    ; rax -- eax -- ax -- ah + al
    ; rcx -- ecx -- cx -- ch + cl
    sar rax, cl     ; desloca os bit de rax para direta 
    and rax, 0xf    ; limpa o bit da esquerda, matendo só os 4 da direita, o resultado é a posicao do char em codes

    lea rsi, [codes + rax] ; set posicao do char em rsi
    mov rax, 1             ; mov codigo da syscall para escrita

    ; syscall deixa rcx e r11 alterados
    push rcx    ; guarda rcx na pilha
    syscall     ; escreve char
    pop rcx     ; recupera rcx

    pop rax     ; recupera rax
    ; test pode ser usado para uma vcerificação mais rápida do tipo 'é um zero?'
    ; consulte a documentação do comendo 'test'
    test rcx, rcx   ; testa se rcx == 0
    jnz .loop       ; se teste != 0 volta para loop

    mov rax, 60     ; faz a chamada de sistema 'exit'
    xor rdi, rdi
    syscall
