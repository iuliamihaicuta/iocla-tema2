%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char plain, int len_key, charkey, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    xor edi, edi
for_loop:
    mov ecx, edi
    ; finds the index of the letter from the key
modulo:
    cmp ecx, [ebp + 16]
    jl modulo_end
    sub ecx, [ebp + 16]
    jmp modulo
modulo_end:

    ; substracting the ascii code of the
    ; key from the string
    xor eax, eax
    mov al, [ebx + edi]
    sub al, byte [edx + ecx]
    neg al

    cmp al, 0
    jge end
    ; if the number of shifts is negative
    ; we add it to the number of letters
    add al, 26
end:
    ; adds the letter A in ascii code
    add al, 65
    mov byte [esi + edi], al

    inc edi
    cmp edi, [ebp + 8]
    jl for_loop

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
