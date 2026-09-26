algoritmo "Exercicio8_Comentado"
var
   m: vetor[1..3, 1..3] de inteiro
   i, j, soma: inteiro
inicio
   soma <- 0

   // PASSO 1: Leitura da matriz e verificação simultânea da diagonal secundária
   para i de 1 ate 3 faca
      para j de 1 ate 3 faca
         escreva("Elemento [", i, ",", j, "]: ")
         leia(m[i, j])
         
         // PASSO 2: Na diagonal secundária, a soma da linha com a coluna é sempre n + 1 (3 + 1 = 4)
         se (i + j = 4) entao
            soma <- soma + m[i, j]
         fimse
      endpara
   endpara

   escreval()
   escreval("Soma da diagonal secundária: ", soma)
fimalgoritmo