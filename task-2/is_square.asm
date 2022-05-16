%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ; set all values 0
    xor edi, edi
set:
    mov dword [ecx + 4 * edi], 0
    inc edi
    cmp edi, eax
    jl set

    xor edi, edi
for_loop:
    xor esi, esi

idx_loop:
    mov eax, esi
    mul eax
    ; checks if the number is square
    cmp eax, [ebx + 4 * edi]
    jne continue
    ; sets the values 0
    mov dword [ecx + 4 * edi], 1
continue:
    inc esi
    cmp esi, [ebx + 4 * edi]
    jle idx_loop

    inc edi
    cmp edi, [ebp + 12]
    jl for_loop

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY