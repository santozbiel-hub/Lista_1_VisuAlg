algoritmo "Exercicio1"

var
   // Declara um vetor chamado 'v' com 10 posições do tipo inteiro
   v: vetor[1..10] de inteiro
   i: inteiro

inicio
   // --- Leitura dos 10 números ---
   escreval("--- Digite 10 números inteiros ---")
   para i de 1 ate 10 faca
      escreva("Digite o ", i, "º número: ")
      leia(v[i])
   fimpara

   // --- Exibição na ordem inversa ---
   escreval()
   escreval("--- Números na Ordem Inversa ---")
   
   // O segredo está no 'passo -1', que faz o contador andar para trás (de 10 até 1)
   para i de 10 ate 1 passo -1 faca
      escreval("Posição ", i, ": ", v[i])
   fimpara

fimalgoritmo