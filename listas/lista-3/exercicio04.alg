algoritmo "Exercicio4"
var
   v: vetor[1..10] de inteiro
   i: inteiro

inicio
   // --- Leitura dos 10 números ---
   escreval("--- Digite 10 números inteiros ---")
   para i de 1 ate 10 faca
      escreva("Digite o ", i, "º número: ")
      leia(v[i])
   fimpara

   // --- Verificação e exibição dos números pares ---
   escreval()
   escreval("--- Números Pares Armazenados ---")
   
   para i de 1 ate 10 faca
      // O operador 'mod' verifica o resto da divisão por 2
      se (v[i] mod 2 = 0) entao
         escreval(v[i])
      fimse
   fimpara

fimalgoritmo