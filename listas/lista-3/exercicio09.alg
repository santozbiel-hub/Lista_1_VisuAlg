algoritmo "Exercicio9_Comentado"
var
   m: vetor[1..2, 1..3] de inteiro
   i, j, maior: inteiro
inicio
   // PASSO 1: Preenchimento da matriz 2x3
   para i de 1 ate 2 faca
      para j de 1 ate 3 faca
         escreva("Elemento [", i, ",", j, "]: ")
         leia(m[i, j])
      endpara
   endpara

   // PASSO 2: Definir o primeiro elemento como o maior provisório
   maior <- m[1, 1]

   // PASSO 3: Percorrer toda a matriz buscando valores maiores
   para i de 1 ate 2 faca
      para j de 1 ate 3 faca
         se m[i, j] > maior entao
            maior <- m[i, j] // Atualiza o maior valor encontrado
         fimse
      endpara
   endpara

   escreval()
   escreval("O maior elemento da matriz é: ", maior)
fimalgoritmo