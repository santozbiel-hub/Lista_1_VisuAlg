algoritmo "Exercicio14_Comentado"
tipo
   Cliente = registro
      nome: caractere
      idade: inteiro
      cidade: caractere
   endregistro
var
   c: vetor[1..3] de Cliente
   i: inteiro
   busca: caractere
inicio
   // PASSO 1: Leitura dos clientes
   para i de 1 ate 3 faca
      escreval("--- Cliente ", i, " ---")
      escreva("Nome: ")
      leia(c[i].nome)
      escreva("Idade: ")
      leia(c[i].idade)
      escreva("Cidade: ")
      leia(c[i].cidade)
   endpara

   // PASSO 2: Solicitar a cidade de filtro ao usuário
   escreva("\nDigite a cidade que deseja buscar: ")
   leia(busca)

   // PASSO 3: Exibir somente os clientes que moram na cidade informada
   escreval()
   escreval("--- Clientes Encontrados ---")
   para i de 1 ate 3 faca
      // Usamos maiusc() para ignorar diferenças entre maiúsculas e minúsculas
      se (maiusc(c[i].cidade) = maiusc(busca)) entao
         escreval(c[i].nome)
      fimse
   endpara
fimalgoritmo