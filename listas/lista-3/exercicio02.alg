algoritmo "Exercicio2"
var
   // Declara um vetor chamado 'notas' com 5 posições do tipo real
   notas: vetor[1..5] de real
   i: inteiro
   soma, media: real

inicio
   soma <- 0 // Inicializa a soma com zero

   // --- Leitura das notas dos 5 alunos ---
   escreval("--- Digite as notas dos 5 alunos ---")
   para i de 1 ate 5 faca
      escreva("Nota do aluno ", i, ": ")
      leia(notas[i])
      
      // Acumula a nota digitada na variável soma
      soma <- soma + notas[i]
   fimpara

   // --- Cálculo da média da turma ---
   media <- soma / 5

   // --- Exibição do resultado ---
   escreval()
   escreval("--------------------------------")
   escreval("A média da turma é: ", media:5:2) // O ':5:2' formata para mostrar 2 casas decimais
   escreval("--------------------------------")

fimalgoritmo