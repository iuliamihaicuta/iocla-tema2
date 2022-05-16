%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
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
start_copy:
    mov cl, byte[ebx + edi]
    mov byte[esi + edi], cl
    inc edi
    cmp edi, eax
    jl start_copy    

    ; xor eax, eax
    xor edi, edi
loop_plain:
    mov eax, edi
modulo:
    cmp eax, ecx
    jl modulo_end
    sub eax, ecx
    jmp modulo
modulo_end:

    ; PRINTF32 `\t\t%d %d\n\x0`, edi, eax
            
    ; xor ecx, ecx
    ; xor ebx, ebx
    ; mov cl, byte [ebp + 12 + edi]
    ; PRINTF32 `%c %hd\n\x0`, ecx, ecx
    ; mov cl, byte [ebp + 20 + eax]
    ; PRINTF32 `\t%c %hd\n\x0`, ecx, ecx
    ; add bl, byte [ebp + 12 + edi]
    ; cmp bl, 'A'
    ; jge end
    ; sub bl, 25
    ; neg bl
end:
    add cl, bl
    ; PRINTF32 `\t\t%c %hd\n\x0`, ecx, ecx
continue:

    inc edi
    cmp edi, [ebp + 8]
    jl loop_plain


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
