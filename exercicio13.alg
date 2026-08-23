algoritmo "exercicio13"
var
   altura, peso, imc: real
inicio
   escreva("Digite sua altura em metros: ")
   leia(altura)
   escreva("Digite seu peso em kg: ")
   leia(peso)

   imc <- peso / (altura * altura)
   escreval("IMC: ", imc)

   se imc < 18.5 entao
      escreval("Abaixo do peso.")
   senao
      se imc < 25 entao
         escreval("Peso normal.")
      senao
         se imc < 30 entao
            escreval("Sobrepeso.")
         senao
            se imc < 35 entao
               escreval("Obesidade grau I.")
            senao
               se imc < 40 entao
                  escreval("Obesidade grau II.")
               senao
                  escreval("Obesidade grau III.")
               fimse
            fimse
         fimse
      fimse
   fimse
fimalgoritmo
