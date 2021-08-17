section .data
  msg1  db  10, "---CALCULADORA---", 10,0
  lmsg1 equ   $ - msg1
  
  msg2  db  10, "Numero 1: ", 0 
  lmsg2 equ   $ - msg2

  msg3  db  10, "Numero 2: ", 0 
  lmsg3 equ   $ - msg3

section .bss
  ; Espacios reservados para almacenar los valores proporcionados
  ; por el usuario.
  num1    resw 2
  num2    resw 2
  result  resw 2

section .text
  global _start

_start:
  ;imprimimos en pantalla el mensaje 1 (BIENVENIDA)
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, lmsg1
  int 80h

  ;imprimimos en pantalla el mensaje 2 (pidiendo el primer numero)
  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, lmsg2
  int 80h 

  ;obtenemos el num1
  mov eax, 3
  mov ebx, 0
  mov ecx, num1
  mov edx, 2
  int 80h

  
  ;imprimimos en pantalla el mensaje 3 (pidiendo el segundo numero)
  mov eax, 4
  mov ebx, 1
  mov ecx, msg3
  mov edx, lmsg3
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
 
