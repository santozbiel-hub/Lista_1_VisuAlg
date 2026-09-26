algoritmo "Exercicio20_Comentado"
var
   n, resultado: inteiro

// Função recursiva para encontrar o n-ésimo termo de Fibonacci
funcao fibonacci(num: inteiro): inteiro
inicio
   // PASSO 1: Casos base (as posições 0 e 1 retornam o próprio número)
   se (num <= 1) entao
      retorne num
   senao
      // PASSO 2: Passo recursivo (soma os dois termos anteriores chamando a função duas vezes)
      retorne fibonacci(num - 1) + fibonacci(num - 2)
   fimse
endfuncao

inicio
   escreva("Digite a posição desejada na sequência de Fibonacci: ")
   leia(n)

   resultado <- fibonacci(n)
   escreval("O termo correspondente é: ", resultado)
fimalgoritmo