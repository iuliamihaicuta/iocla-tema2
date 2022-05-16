%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ; finds the real number of shifts
    mov eax, 26
modulo:
    cmp edx, eax
    jl modulo_end
    sub edx, eax
    jmp modulo
modulo_end:

    ; gives the enc_string the initial value
    xor ebx, ebx
start_copy:
    mov al, byte[esi + ebx]
    mov byte[edi + ebx], al
    inc ebx
    cmp ebx, ecx
    jl start_copy

    cmp edx, 0
    je end

    xor eax, eax
shift_letter:
    inc eax
    xor ebx, ebx
for_shift:
    ; check if we hit the end of the alphabet
    cmp byte[edi + ebx], 'Z'
    jne shift
    mov byte[edi + ebx], 'A'

    jmp next

shift:
    inc byte[edi + ebx]
next:
    inc ebx

    ; checks if we shifted the letter
    cmp ebx, ecx
    jl for_shift

    ; checks if we have letters left
    cmp eax, edx
    jl shift_letter
end:
    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
