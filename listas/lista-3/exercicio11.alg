algoritmo "Exercicio11_Comentado"
tipo
   // Define a estrutura do Registro (agrupa dados de tipos diferentes)
   Aluno = registro
      nome: caractere
      idade: inteiro
      notaFinal: real
   endregistro
var
   turma: vetor[1..5] de Aluno
   i: inteiro
inicio
   // PASSO 1: Ler os dados de 5 alunos usando a estrutura de registro
   para i de 1 ate 5 faca
      escreval("--- Cadastro do Aluno ", i, " ---")
      escreva("Nome: ")
      leia(turma[i].nome)
      escreva("Idade: ")
      leia(turma[i].idade)
      escreva("Nota Final: ")
      leia(turma[i].notaFinal)
   endpara

   // PASSO 2: Filtrar e exibir apenas os aprovados (nota >= 6)
   escreval()
   escreval("--- Alunos Aprovados ---")
   para i de 1 ate 5 faca
      se turma[i].notaFinal >= 6 entao
         escreval("Nome: ", turma[i].nome)
      fimse
   endpara
fimalgoritmo