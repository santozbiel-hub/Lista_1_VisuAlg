algoritmo "Exercicio17_Comentado"
var
   v: vetor[1..8] de inteiro
   i, j, aux: inteiro
inicio
   // PASSO 1: Ler os 8 números
   para i de 1 ate 8 faca
      escreva("Digite o ", i, "º número: ")
      leia(v[i])
   endpara

   // PASSO 2: Bubble Sort Decrescente (inverte o sinal de comparação para '<')
   para i de 1 ate 7 faca
      para j de 1 ate 8 - i faca
         se v[j] < v[j+1] entao
            aux <- v[j]
            v[j] <- v[j+1]
            v[j+1] <- aux
         fimse
      endpara
   endpara

   // PASSO 3: Exibir o resultado decrescente
   escreval()
   escreval("--- Vetor em Ordem Decrescente ---")
   para i de 1 ate 8 faca
      escreval(v[i])
   endpara
fimalgoritmo