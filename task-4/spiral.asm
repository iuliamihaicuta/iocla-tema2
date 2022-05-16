%include "../include/io.mac"

section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    xor edx, edx
    mov esi, 2
    div esi
    add eax, edx ; n / 2
    push eax
    
    xor eax, eax
    mov esi, [ebp + 20]
loop_nr:
    ; edi -> the number of iterations
    mov edi, [ebp + 8]
    sub edi, eax ; edi = n - 2 * eax
    sub edi, eax

    cmp edi, 0
    jle skip_right
    
loop_right:
    push eax
    ; sum of the correspondent letters
    mov al, byte [ebx]
    add al, byte [ecx]
    ; get to the next element
    add ecx, 4
    inc ebx
    
    ; saves the encrypted value
    mov byte [esi], al
    inc esi
    pop eax
    
    dec edi
    cmp edi, 0
    jg loop_right

    ; sets the start position for the next step
    sub ecx, 4
    push eax
    mov eax, [ebp + 8]
    add eax, eax
    add eax, eax
    add ecx, eax
    pop eax

skip_right:

    ; edi -> the number of iterations
    mov edi, [ebp + 8]
    dec edi
    sub edi, eax
    sub edi, eax

    cmp edi, 0
    jle skip_down
loop_down:
    push eax
    ; sum of the correspondent letters
    mov al, byte [ebx]
    add al, byte [ecx]
    ; saves the encrypted value
    mov byte [esi], al

    ; get to the next element
    push eax
    mov eax, [ebp + 8]
    add eax, eax
    add eax, eax
    add ecx, eax
    pop eax 

    inc ebx

    inc esi
    pop eax

    dec edi
    cmp edi, 0
    jg loop_down

    ; sets the start position for the next step
    push eax
    mov eax, [ebp + 8]
    add eax, eax
    add eax, eax
    sub ecx, eax
    pop eax
    sub ecx, 4

skip_down:

    ; edi -> the number of iterations
    mov edi, [ebp + 8]
    dec edi
    sub edi, eax
    sub edi, eax

    cmp edi, 0
    jle skip_left
loop_left:
    push eax
    ; sum of the correspondent letters
    mov al, byte [ebx]
    add al, byte [ecx]
    ; get to the next element
    sub ecx, 4
    inc ebx

    ; saves the encrypted value
    mov byte [esi], al
    inc esi
    pop eax

    dec edi
    cmp edi, 0
    jg loop_left

    ; sets the start position for the next step
    add ecx, 4
    push eax
    mov eax, [ebp + 8]
    add eax, eax
    add eax, eax
    sub ecx, eax
    pop eax

skip_left:

    ; edi -> the number of iterations
    mov edi, [ebp + 8]
    sub edi, 2
    sub edi, eax
    sub edi, eax

    cmp edi, 0
    jle skip_up
loop_up:
    push eax
    ; sum of the correspondent letters
    mov al, byte [ebx]
    add al, byte [ecx]
    ; saves the encrypted value
    mov byte [esi], al

    ; get to the next element
    push eax
    mov eax, [ebp + 8]
    add eax, eax
    add eax, eax
    sub ecx, eax
    pop eax 

    inc ebx
    inc esi
    pop eax

    dec edi
    cmp edi, 0
    jg loop_up

    ; sets the start position for the next step
    push eax
    mov eax, [ebp + 8]
    add eax, eax
    add eax, eax
    add ecx, eax
    pop eax 
    add ecx, 4

skip_up:
    
    inc eax
    cmp eax, [esp]
    jl loop_nr

    add esp, 4

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
