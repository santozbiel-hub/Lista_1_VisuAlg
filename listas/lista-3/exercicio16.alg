algoritmo "Exercicio16_Comentado"
var
   v: vetor[1..6] de inteiro
   i, j, aux: inteiro
inicio
   // PASSO 1: Ler os 6 números do vetor
   para i de 1 ate 6 faca
      escreva("Digite o ", i, "º número: ")
      leia(v[i])
   endpara

   // PASSO 2: Aplicar o algoritmo de ordenação Bubble Sort (Crescente)
   para i de 1 ate 5 faca
      para j de 1 ate 6 - i faca
         // Se o elemento da esquerda for maior que o da direita, troca de lugar
         se v[j] > v[j+1] entao
            aux <- v[j]     // Guarda o valor temporariamente
            v[j] <- v[j+1]  // Move o menor para a esquerda
            v[j+1] <- aux   // Move o maior para a direita
         fimse
      endpara
   endpara

   // PASSO 3: Exibir o vetor já ordenado
   escreval()
   escreval("--- Vetor em Ordem Crescente ---")
   para i de 1 ate 6 faca
      escreval(v[i])
   endpara
fimalgoritmo