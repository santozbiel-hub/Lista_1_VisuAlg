algoritmo "Exercicio19_Comentado"
var
   n, resultado: inteiro

// Função recursiva que calcula o fatorial de um número
funcao fatorial(num: inteiro): inteiro
inicio
   // PASSO 1: Caso Base (condição de parada da recursividade)
   se (num <= 1) entao
      retorne 1
   senao
      // PASSO 2: Passo recursivo (a função chama a si mesma reduzindo o parâmetro)
      retorne num * fatorial(num - 1)
   fimse
endfuncao

inicio
   escreva("Digite um número para calcular o fatorial: ")
   leia(n)

   resultado <- fatorial(n)
   escreval("O fatorial é: ", resultado)
fimalgoritmo