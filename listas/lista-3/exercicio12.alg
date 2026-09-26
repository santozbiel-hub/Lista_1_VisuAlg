algoritmo "Exercicio12_Comentado"
tipo
   Funcionario = registro
      nome: caractere
      cargo: caractere
      salario: real
   endregistro
var
   f: vetor[1..3] de Funcionario
   i, maiorIdx: inteiro
inicio
   // PASSO 1: Leitura dos dados dos funcionários
   para i de 1 ate 3 faca
      escreval("--- Funcionário ", i, " ---")
      escreva("Nome: ")
      leia(f[i].nome)
      escreva("Cargo: ")
      leia(f[i].cargo)
      escreva("Salário: ")
      leia(f[i].salario)
   endpara

   // PASSO 2: Assumir que o primeiro funcionário tem o maior salário inicialmente
   maiorIdx <- 1

   // PASSO 3: Comparar com os demais para encontrar o maior salário
   para i de 2 ate 3 faca
      se f[i].salario > f[maiorIdx].salario entao
         maiorIdx <- i // Atualiza o índice do funcionário mais bem pago
      fimse
   endpara

   escreval()
   escreval("Funcionário com maior salário: ", f[maiorIdx].nome)
fimalgoritmo