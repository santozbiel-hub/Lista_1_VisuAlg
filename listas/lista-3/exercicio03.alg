algoritmo "Exercicio3"
var
   v: vetor[1..8] de inteiro
   i, maior, menor: inteiro

inicio
   // --- Leitura dos 8 números ---
   escreval("--- Digite 8 números inteiros ---")
   para i de 1 ate 8 faca
      escreva("Digite o ", i, "º número: ")
      leia(v[i])
   fimpara

   // --- Inicialização com o primeiro elemento ---
   // Supomos temporariamente que o primeiro número é o maior e o menor
   maior <- v[1]
   menor <- v[1]

   // --- Comparação para encontrar o maior e o menor ---
   para i de 2 ate 8 faca
      // Se o número atual for maior que o 'maior' guardado, ele passa a ser o novo maior
      se v[i] > maior entao
         maior <- v[i]
      fimse

      // Se o número atual for menor que o 'menor' guardado, ele passa a ser o novo menor
      se v[i] < menor entao
         menor <- v[i]
      fimse
   fimpara

   // --- Exibição dos resultados ---
   escreval()
   escreval("--------------------------------")
   escreval("O maior número armazenado é: ", maior)
   escreval("O menor número armazenado é: ", menor)
   escreval("--------------------------------")

fimalgoritmo