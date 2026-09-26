algoritmo "Exercicio18_Comentado"
var
   notas: vetor[1..5] de real
   i, j: inteiro
   aux: real
inicio
   // PASSO 1: Leitura das notas
   para i de 1 ate 5 faca
      escreva("Nota do aluno ", i, ": ")
      leia(notas[i])
   endpara

   // PASSO 2: Bubble Sort adaptado para o tipo real (ordem crescente)
   para i de 1 ate 4 faca
      para j de 1 ate 5 - i faca
         se notas[j] > notas[j+1] entao
            aux <- notas[j]
            notas[j] <- notas[j+1]
            notas[j+1] <- aux
         fimse
      endpara
   endpara

   // PASSO 3: Exibir notas ordenadas
   escreval()
   escreval("--- Notas em Ordem Crescente ---")
   para i de 1 ate 5 faca
      escreval(notas[i]:5:2)
   endpara
fimalgoritmo