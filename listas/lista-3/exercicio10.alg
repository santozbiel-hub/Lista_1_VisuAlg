algoritmo "Exercicio10_Comentado"
var
   m: vetor[1..4, 1..4] de inteiro
   i, j, contPares: inteiro
inicio
   contPares <- 0

   // PASSO 1: Ler os dados da matriz 4x4
   para i de 1 ate 4 faca
      para j de 1 ate 4 faca
         escreva("Elemento [", i, ",", j, "]: ")
         leia(m[i, j])
         
         // PASSO 2: Verificar se o número digitado é par e incrementar o contador
         se (m[i, j] mod 2 = 0) entao
            contPares <- contPares + 1
         fimse
      endpara
   endpara

   escreval()
   escreval("Total de números pares na matriz: ", contPares)
fimalgoritmo