algoritmo "Exercicio7_Comentado"
var
   m: vetor[1..3, 1..3] de inteiro
   i, j: inteiro
inicio
   // PASSO 1: Preencher a matriz 3x3
   para i de 1 ate 3 faca
      para j de 1 ate 3 faca
         escreva("Elemento [", i, ",", j, "]: ")
         leia(m[i, j])
      endpara
   endpara

   // PASSO 2: Exibir os elementos da diagonal principal
   escreval()
   escreval("--- Diagonal Principal ---")
   // Na diagonal principal, a linha é sempre igual à coluna ([1,1], [2,2], [3,3])
   para i de 1 ate 3 faca
      escreval(m[i, i])
   endpara
fimalgoritmo