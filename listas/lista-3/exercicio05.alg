algoritmo "Exercicio5_Comentado"
var
   v: vetor[1..15] de inteiro
   i: inteiro
inicio
   // PASSO 1: Leitura dos 15 números
   para i de 1 ate 15 faca
      escreva("Digite o ", i, "º número: ")
      leia(v[i])
   fimpara

   // PASSO 2: Percorrer apenas os índices pares do vetor
   escreval()
   escreval("--- Elementos nas Posições Pares ---")
   // O 'passo 2' faz o laço saltar de dois em dois índices (2, 4, 6, 8...)
   para i de 2 ate 15 passo 2 faca
      escreval("Posição ", i, ": ", v[i])
   fimpara
fimalgoritmo