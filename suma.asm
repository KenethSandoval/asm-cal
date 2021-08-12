section .bss
  num1    resw 2
  num2    resw 2
  result  resw 2

section .text
  global _start

_start:
  ;obtenemos el num1
  mov eax, 3
  mov ebx, 0
  mov ecx, num1
  mov edx, 2
  int 80h

  ;obtenemos el num2
  mov eax, 3
  mov ebx, 0
  mov ecx, num2
  mov edx, 2
  int 80h

  ; sumar
  mov eax, [num1]
  mov ebx, [num2]

  sub eax, '0'
  sub ebx, '0'

  ; sumamos
  add eax, ebx

  add eax, '0'

  ; movemos el resultado
  mov [result], eax

  ;imprimimos el resultado

  mov eax, 4
  mov ebx, 1
  mov ecx, result
  mov edx, 1
  int 80h

  mov eax, 1
  int 80h
 
