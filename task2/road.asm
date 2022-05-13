%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf
    extern points_distance

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov esi, eax
    mov edi, ebx
    xor eax, eax

loop_arr:
    push edi
    push esi

    call points_distance

    ; we move to the next points
    lea esp, [esp + 8]
    lea edi, [edi + 4]
    lea esi, [esi + point_size]

    loop loop_arr

    mov ebx, esi
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY