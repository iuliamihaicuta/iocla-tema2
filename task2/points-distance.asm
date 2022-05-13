%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor edx, edx
    xor ecx, ecx
    mov dx, word [ebx + point.x]    ; x0
    mov cx, word [ebx + point.y]    ; y0

    sub dx, word [ebx + point_size + point.x]   ; x0 - x1
    sub cx, word [ebx + point_size + point.y]   ; y0 - y1

    add edx, ecx    ; x0 - x1 + y0 - y1

    cmp dx, 0
    jge end
    neg dx

end:
    mov [eax], edx

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY