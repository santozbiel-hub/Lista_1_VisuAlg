algoritmo "Exercicio6_Comentado"
var
   m: vetor[1..2, 1..2] de inteiro
   i, j, soma: inteiro
inicio
   soma <- 0

   // PASSO 1: Laços aninhados para ler a matriz 2x2 (Linhas 'i' e Colunas 'j')
   para i de 1 ate 2 faca
      para j de 1 ate 2 faca
         escreva("Digite o elemento [", i, ",", j, "]: ")
         leia(m[i, j])
         
         // PASSO 2: Acumular cada elemento lido na variável de soma
         soma <- soma + m[i, j]
      fimpara
   endpara

   // PASSO 3: Exibir o resultado total
   escreval()
   escreval("A soma de todos os elementos da matriz é: ", soma)
fimalgoritmo