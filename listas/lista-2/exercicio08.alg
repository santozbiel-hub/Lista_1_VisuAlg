algoritmo "Lista2_Exercicio08"
var
   nota1, nota2, nota3, media: real
inicio
   escreva("Primeira nota: ")
   leia(nota1)
   escreva("Segunda nota: ")
   leia(nota2)
   escreva("Terceira nota: ")
   leia(nota3)

   media <- (nota1 + nota2 + nota3) / 3
   escreval("Media: ", media:0:2)
   se media >= 7 entao
      escreval("Aprovado.")
   senao
      escreval("Reprovado.")
   fimse
fimalgoritmo
