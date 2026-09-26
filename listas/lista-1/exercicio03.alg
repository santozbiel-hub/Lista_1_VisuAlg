algoritmo "exercicio3"
var
   nota1, nota2, media: real
inicio
   escreva("Digite a primeira nota: ")
   leia(nota1)
   escreva("Digite a segunda nota: ")
   leia(nota2)

   media <- (nota1 + nota2) / 2
   escreval("Media: ", media)

   se media >= 7 entao
      escreval("Aluno aprovado!")
   senao
      escreval("Aluno reprovado!")
   fimse
fimalgoritmo
