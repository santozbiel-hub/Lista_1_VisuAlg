algoritmo "MedControl"
// ======================================================================
// Desafio 1 - Tema 2 - MedControl | Aluno: Gabriel Santos Silva
// Sistema de gerenciamento de atendimentos de uma clinica medica.
//
// Organizacao dos dados:
// - Cada paciente ocupa o MESMO indice i em varios vetores paralelos
//   (codigo[i], nome[i], idade[i]...). O indice i funciona como o
//   "registro" do paciente: tudo que esta na posicao i pertence a ele.
// - Matriz est[prioridade, coluna] guarda as estatisticas:
//   coluna 1 = cadastrados | 2 = aguardando | 3 = atendidos.
// - Vetor fila guarda as POSICOES dos pacientes aguardando, ordenadas
//   por prioridade, idade e ordem de cadastro.
// - Valores fixos ficam em variaveis em MAIUSCULO, definidas uma unica
//   vez em definirConstantes e nunca alteradas (convencao do VisuAlg
//   para constantes).
// - Cada funcao/procedimento usa nomes proprios de parametros e
//   variaveis locais (ex.: codBusca, pac, pr), sem repetir os nomes de
//   quem a chama. Assim o codigo roda tanto no VisuAlg desktop quanto
//   no VisuAlg Web, cujo interpretador apaga variaveis de mesmo nome
//   do chamador quando a sub-rotina termina.
// ======================================================================

var
   // ---- "constantes" do sistema (definidas uma vez, nunca alteradas) ----
   MAX_PACIENTES, NAO_ENCONTRADO: inteiro
   EMERGENCIA, MUITO_URGENTE, URGENTE, POUCO_URGENTE: inteiro
   AGUARDANDO, ATENDIDO: inteiro
   COL_CADASTRADOS, COL_AGUARDANDO, COL_ATENDIDOS: inteiro
   IDADE_MAX, OPCAO_SAIR: inteiro
   TEMP_MIN, TEMP_MAX: real

   // ---- dados dos pacientes (vetores paralelos: indice = paciente) ----
   codigo: vetor[1..30] de inteiro
   nome: vetor[1..30] de caractere
   idade: vetor[1..30] de inteiro
   sexo: vetor[1..30] de caractere
   prioridade: vetor[1..30] de inteiro
   sistolica: vetor[1..30] de inteiro
   diastolica: vetor[1..30] de inteiro
   temperatura: vetor[1..30] de real
   status: vetor[1..30] de inteiro

   // ---- estruturas de apoio ----
   est: vetor[1..4, 1..3] de inteiro   // matriz de estatisticas
   fila: vetor[1..30] de inteiro       // posicoes dos pacientes em ordem de atendimento
   qtd: inteiro                        // quantos pacientes ja foram cadastrados
   opcao: inteiro                      // opcao escolhida no menu

// ======================================================================
// INICIALIZACAO
// ======================================================================

procedimento definirConstantes
inicio
   MAX_PACIENTES <- 30
   NAO_ENCONTRADO <- 0      // posicoes validas comecam em 1, entao 0 = nao achou
   EMERGENCIA <- 1
   MUITO_URGENTE <- 2
   URGENTE <- 3
   POUCO_URGENTE <- 4
   AGUARDANDO <- 0
   ATENDIDO <- 1
   COL_CADASTRADOS <- 1
   COL_AGUARDANDO <- 2
   COL_ATENDIDOS <- 3
   IDADE_MAX <- 130
   OPCAO_SAIR <- 9
   TEMP_MIN <- 30
   TEMP_MAX <- 45
fimprocedimento

// Zera a matriz com lacos aninhados (linha x coluna)
procedimento zerarEstatisticas
var i, j: inteiro
inicio
   para i de EMERGENCIA ate POUCO_URGENTE faca
      para j de COL_CADASTRADOS ate COL_ATENDIDOS faca
         est[i, j] <- 0
      fimpara
   fimpara
fimprocedimento

// ======================================================================
// FUNCOES AUXILIARES
// ======================================================================

// Converte o numero da prioridade em texto (condicional encadeada)
funcao nomePrioridade(pr: inteiro): caractere
var txtPrio: caractere
inicio
   se pr = EMERGENCIA entao
      txtPrio <- "Emergencia"
   senao
      se pr = MUITO_URGENTE entao
         txtPrio <- "Muito urgente"
      senao
         se pr = URGENTE entao
            txtPrio <- "Urgente"
         senao
            txtPrio <- "Pouco urgente"
         fimse
      fimse
   fimse
   retorne txtPrio
fimfuncao

// Converte o status em texto (condicional composta)
funcao nomeStatus(st: inteiro): caractere
var txtStatus: caractere
inicio
   se st = ATENDIDO entao
      txtStatus <- "Atendido"
   senao
      txtStatus <- "Aguardando atendimento"
   fimse
   retorne txtStatus
fimfuncao

// Media com protecao contra divisao por zero
funcao calcularMedia(soma, qtdItens: real): real
var media: real
inicio
   media <- 0
   se qtdItens > 0 entao
      media <- soma / qtdItens
   fimse
   retorne media
fimfuncao

// ======================================================================
// LEITURA SEGURA DE NUMEROS
// leia() direto numa variavel inteira/real derruba o programa se o
// usuario apertar Enter vazio ou digitar letra. Por isso o texto e lido
// como caractere, conferido caractere por caractere e so depois
// convertido com caracpnum. Sao procedimentos com "var" (e nao funcoes)
// porque precisam escrever mensagens na tela.
// ======================================================================

// Le um inteiro: aceita so digitos (e um "-" no inicio). Repete ate valer.
procedimento lerInteiro(var valorInt: inteiro)
var txtInt, chInt: caractere
    kInt: inteiro
    validoInt: logico
inicio
   repita
      leia(txtInt)
      validoInt <- compr(txtInt) > 0
      para kInt de 1 ate compr(txtInt) faca
         chInt <- copia(txtInt, kInt, 1)
         se (chInt < "0") ou (chInt > "9") entao
            se nao ((kInt = 1) e (chInt = "-") e (compr(txtInt) > 1)) entao
               validoInt <- falso
            fimse
         fimse
      fimpara
      se nao validoInt entao
         escreva("Erro: digite um numero inteiro. Tente de novo: ")
      fimse
   ate validoInt
   valorInt <- caracpnum(txtInt)
fimprocedimento

// Le um real: aceita digitos e UM separador decimal ("." ou ",").
// A virgula vira ponto. Devolve o TEXTO ja validado, e quem chama
// converte com caracpnum. (O VisuAlg Web recusa devolver por "var" um
// real sem casas decimais, como 38, porque o trata como inteiro.)
procedimento lerReal(var textoReal: caractere)
var txtReal, chReal, limpo: caractere
    kReal, pontos: inteiro
    validoReal: logico
inicio
   repita
      leia(txtReal)
      validoReal <- compr(txtReal) > 0
      pontos <- 0
      limpo <- ""
      para kReal de 1 ate compr(txtReal) faca
         chReal <- copia(txtReal, kReal, 1)
         se (chReal = ".") ou (chReal = ",") entao
            pontos <- pontos + 1
            limpo <- limpo + "."
         senao
            se (chReal < "0") ou (chReal > "9") entao
               validoReal <- falso
            fimse
            limpo <- limpo + chReal
         fimse
      fimpara
      se (pontos > 1) ou (limpo = ".") entao
         validoReal <- falso
      fimse
      se nao validoReal entao
         escreva("Erro: digite um numero (ex.: 36.5). Tente de novo: ")
      fimse
   ate validoReal
   textoReal <- limpo
fimprocedimento

// ======================================================================
// BUSCAS
// ======================================================================

// Busca ITERATIVA: devolve a posicao do codigo ou NAO_ENCONTRADO.
// E funcao porque responde uma pergunta (onde esta o paciente?).
funcao buscar(codBusca, total: inteiro): inteiro
var bi, achou: inteiro      // locais: so existem durante a busca
inicio
   achou <- NAO_ENCONTRADO
   bi <- 1
   enquanto (bi <= total) e (achou = NAO_ENCONTRADO) faca
      se codigo[bi] = codBusca entao
         achou <- bi
      fimse
      bi <- bi + 1
   fimenquanto
   retorne achou
fimfuncao

// Busca RECURSIVA
// Caso-base 1: posAtual > lim    -> ja olhou tudo, nao achou
// Caso-base 2: codigo bate  -> achou, devolve a posicao
// Passo recursivo: chama a si mesma com a proxima posicao
funcao buscaRec(codAlvo, posAtual, lim: inteiro): inteiro
var resultado: inteiro
inicio
   se posAtual > lim entao
      resultado <- NAO_ENCONTRADO
   senao
      se codigo[posAtual] = codAlvo entao
         resultado <- posAtual
      senao
         resultado <- buscaRec(codAlvo, posAtual + 1, lim)
      fimse
   fimse
   retorne resultado
fimfuncao

// Contagem RECURSIVA de quem aguarda:
// quantidade(posC) = valor da posicao atual + quantidade(proxima posicao)
funcao contaAguardando(posC, limC: inteiro): inteiro
var atual, totalC: inteiro
inicio
   se posC > limC entao
      totalC <- 0                                          // caso-base
   senao
      atual <- 0
      se status[posC] = AGUARDANDO entao
         atual <- 1
      fimse
      totalC <- atual + contaAguardando(posC + 1, limC)    // passo recursivo
   fimse
   retorne totalC
fimfuncao

// ======================================================================
// FILA E ORDENACAO
// ======================================================================

// Regra da fila: o paciente da posicao a vem antes do da posicao b?
// 1) prioridade mais grave (numero menor)                        OU
// 2) mesma prioridade E mais velho                               OU
// 3) mesma prioridade E mesma idade E cadastrado antes (a < b)
funcao vemAntes(a, b: inteiro): logico
inicio
   retorne (prioridade[a] < prioridade[b]) ou ((prioridade[a] = prioridade[b]) e (idade[a] > idade[b])) ou ((prioridade[a] = prioridade[b]) e (idade[a] = idade[b]) e (a < b))
fimfuncao

// Monta a fila so com quem aguarda e ordena com BUBBLE SORT.
// Troca so as posicoes guardadas em fila; os dados dos pacientes
// continuam intactos nos vetores principais.
// Devolve o tamanho da fila (quantos estao aguardando).
funcao montarFila(limite: inteiro): inteiro
var mi, mj, aux, tamFila: inteiro
inicio
   tamFila <- 0
   para mi de 1 ate limite faca
      se status[mi] = AGUARDANDO entao
         tamFila <- tamFila + 1
         fila[tamFila] <- mi
      fimse
   fimpara
   para mi de 1 ate tamFila - 1 faca                // lacos aninhados
      para mj de 1 ate tamFila - mi faca
         se vemAntes(fila[mj + 1], fila[mj]) entao
            aux <- fila[mj]                      // variavel auxiliar da troca
            fila[mj] <- fila[mj + 1]
            fila[mj + 1] <- aux
         fimse
      fimpara
   fimpara
   retorne tamFila
fimfuncao

// Mostra os dados de um paciente em uma linha
procedimento mostrarPaciente(pac: inteiro)
inicio
   escreval("Cod ", codigo[pac], " | ", nome[pac], " | ", idade[pac], " anos | ", sexo[pac], " | P", prioridade[pac], " ", nomePrioridade(prioridade[pac]), " | PA ", sistolica[pac], "x", diastolica[pac], " | ", temperatura[pac]:4:1, " C | ", nomeStatus(status[pac]))
fimprocedimento

// ======================================================================
// FUNCIONALIDADES DO MENU
// ======================================================================

// "var n": o cadastro precisa ALTERAR a quantidade de pacientes
procedimento cadastrar(var n: inteiro)
var cod, id, prio, sis, dia: inteiro
    temp: real
    nm, sx, txtTemp: caractere
inicio
   se n >= MAX_PACIENTES entao
      escreval("Erro: capacidade maxima atingida.")
   senao
      // codigo positivo e unico
      repita
         escreva("Codigo: ")
         lerInteiro(cod)
         se cod <= 0 entao
            escreval("Erro: o codigo deve ser positivo.")
         senao
            se buscar(cod, n) <> NAO_ENCONTRADO entao
               escreval("Erro: codigo ja cadastrado.")
            fimse
         fimse
      ate (cod > 0) e (buscar(cod, n) = NAO_ENCONTRADO)

      repita
         escreva("Nome: ")
         leia(nm)
         se nm = "" entao
            escreval("Erro: o nome nao pode ficar vazio.")
         fimse
      ate nm <> ""

      repita
         escreva("Idade: ")
         lerInteiro(id)
         se (id < 0) ou (id > IDADE_MAX) entao
            escreval("Erro: idade invalida.")
         fimse
      ate (id >= 0) e (id <= IDADE_MAX)

      repita
         escreva("Sexo (M/F): ")
         leia(sx)
         sx <- maiusc(sx)
         se (sx <> "M") e (sx <> "F") entao
            escreval("Erro: digite M ou F.")
         fimse
      ate (sx = "M") ou (sx = "F")

      repita
         escreva("Prioridade (1-Emergencia 2-Muito urgente 3-Urgente 4-Pouco urgente): ")
         lerInteiro(prio)
         se nao ((prio >= EMERGENCIA) e (prio <= POUCO_URGENTE)) entao
            escreval("Erro: prioridade inexistente.")
         fimse
      ate (prio >= EMERGENCIA) e (prio <= POUCO_URGENTE)

      repita
         escreva("Pressao sistolica: ")
         lerInteiro(sis)
         escreva("Pressao diastolica: ")
         lerInteiro(dia)
         se (dia <= 0) ou (dia >= sis) entao
            escreval("Erro: pressao invalida (diastolica deve ser positiva e menor que a sistolica).")
         fimse
      ate (dia > 0) e (dia < sis)

      repita
         escreva("Temperatura: ")
         lerReal(txtTemp)
         temp <- caracpnum(txtTemp)
         se (temp < TEMP_MIN) ou (temp > TEMP_MAX) entao
            escreval("Erro: temperatura invalida.")
         fimse
      ate (temp >= TEMP_MIN) e (temp <= TEMP_MAX)

      // grava o paciente na proxima posicao livre
      n <- n + 1
      codigo[n] <- cod
      nome[n] <- nm
      idade[n] <- id
      sexo[n] <- sx
      prioridade[n] <- prio
      sistolica[n] <- sis
      diastolica[n] <- dia
      temperatura[n] <- temp
      status[n] <- AGUARDANDO                  // todo novo paciente comeca aguardando

      // matriz atualizada (1o lugar onde ela muda)
      est[prio, COL_CADASTRADOS] <- est[prio, COL_CADASTRADOS] + 1
      est[prio, COL_AGUARDANDO] <- est[prio, COL_AGUARDANDO] + 1
      escreval("Paciente cadastrado! Status: Aguardando atendimento")
   fimse
fimprocedimento

procedimento listar(n: inteiro)
var i: inteiro
inicio
   para i de 1 ate n faca
      mostrarPaciente(i)
   fimpara
fimprocedimento

procedimento consultar(n: inteiro)
var cod, p: inteiro
inicio
   escreva("Codigo: ")
   lerInteiro(cod)
   p <- buscar(cod, n)
   se p = NAO_ENCONTRADO entao
      escreval("Erro: codigo inexistente.")
   senao
      escreval("Paciente encontrado.")
      mostrarPaciente(p)
   fimse
fimprocedimento

procedimento exibirFila(n: inteiro)
var i, tam: inteiro
inicio
   tam <- montarFila(n)
   se tam = 0 entao
      escreval("Fila vazia: ninguem aguardando.")
   senao
      para i de 1 ate tam faca
         escreva(i, "o -> ")
         mostrarPaciente(fila[i])
      fimpara
   fimse
fimprocedimento

// Muda o status e atualiza a matriz (2o lugar onde ela muda)
procedimento marcarAtendido(pm: inteiro)
inicio
   status[pm] <- ATENDIDO
   est[prioridade[pm], COL_AGUARDANDO] <- est[prioridade[pm], COL_AGUARDANDO] - 1
   est[prioridade[pm], COL_ATENDIDOS] <- est[prioridade[pm], COL_ATENDIDOS] + 1
   escreval("Atendido: ", nome[pm])
fimprocedimento

// 0 = atende o proximo da fila; outro numero = atende aquele codigo
procedimento atender(n: inteiro)
var cod, p, tam: inteiro
inicio
   tam <- montarFila(n)
   se tam > 0 entao
      escreval("Proximo da fila: ", nome[fila[1]], " - codigo ", codigo[fila[1]])
   fimse
   escreva("Digite 0 para o proximo da fila ou o codigo do paciente: ")
   lerInteiro(cod)
   se cod = 0 entao
      se tam = 0 entao
         escreval("Fila vazia: ninguem para atender.")
      senao
         marcarAtendido(fila[1])
      fimse
   senao
      p <- buscar(cod, n)
      se p = NAO_ENCONTRADO entao
         escreval("Erro: paciente inexistente.")
      senao
         se status[p] = ATENDIDO entao
            escreval("Erro: paciente ja foi atendido.")
         senao
            marcarAtendido(p)
         fimse
      fimse
   fimse
fimprocedimento

procedimento exibirAtendidos(n: inteiro)
var i, cont: inteiro
inicio
   cont <- 0
   para i de 1 ate n faca
      se status[i] = ATENDIDO entao
         mostrarPaciente(i)
         cont <- cont + 1
      fimse
   fimpara
   se cont = 0 entao
      escreval("Nenhum paciente atendido ainda.")
   fimse
fimprocedimento

procedimento estatisticas(n: inteiro)
var i, j, atendidos, graves, maior, menor: inteiro
    somaIdade, somaTemp: real
inicio
   atendidos <- 0
   graves <- 0
   somaIdade <- 0
   somaTemp <- 0
   maior <- idade[1]
   menor <- idade[1]
   para i de 1 ate n faca
      somaIdade <- somaIdade + idade[i]           // acumuladores
      somaTemp <- somaTemp + temperatura[i]
      se idade[i] > maior entao
         maior <- idade[i]
      fimse
      se idade[i] < menor entao
         menor <- idade[i]
      fimse
      se status[i] = ATENDIDO entao
         atendidos <- atendidos + 1               // contador
      fimse
      se (prioridade[i] = EMERGENCIA) ou (prioridade[i] = MUITO_URGENTE) entao
         graves <- graves + 1
      fimse
   fimpara
   escreval("Total de pacientes: ", n)
   escreval("Aguardando: ", n - atendidos)
   escreval("Atendidos: ", atendidos)
   escreval("Prioridade 1 ou 2: ", graves)
   escreval("Media de idade: ", calcularMedia(somaIdade, n):6:1)
   escreval("Media de temperatura: ", calcularMedia(somaTemp, n):6:1)
   escreval("Maior idade: ", maior, " | Menor idade: ", menor)
   escreval("% atendidos: ", calcularMedia(atendidos * 100, n):6:1)
   escreval("% aguardando: ", calcularMedia((n - atendidos) * 100, n):6:1)
   escreval("")
   escreval("Matriz por prioridade: cadastrados | aguardando | atendidos")
   para i de EMERGENCIA ate POUCO_URGENTE faca     // matriz com lacos aninhados
      escreva(nomePrioridade(i), ": ")
      para j de COL_CADASTRADOS ate COL_ATENDIDOS faca
         escreva(est[i, j], " | ")
      fimpara
      escreval("")
   fimpara
fimprocedimento

procedimento consultaRecursiva(n: inteiro)
var cod, p: inteiro
inicio
   escreva("Codigo: ")
   lerInteiro(cod)
   p <- buscaRec(cod, 1, n)          // comeca na posicao 1
   se p = NAO_ENCONTRADO entao
      escreval("Erro: codigo inexistente.")
   senao
      escreval("Encontrado na posicao ", p)
      mostrarPaciente(p)
   fimse
   escreval("Aguardando (contagem recursiva): ", contaAguardando(1, n))
fimprocedimento

// ======================================================================
// PROGRAMA PRINCIPAL
// ======================================================================
inicio
   definirConstantes
   zerarEstatisticas
   qtd <- 0
   repita
      escreval("")
      escreval("MEDCONTROL - GERENCIAMENTO DE ATENDIMENTOS")
      escreval("1-Cadastrar  2-Listar  3-Consultar  4-Fila  5-Atender")
      escreval("6-Atendidos  7-Estatisticas  8-Consulta recursiva  9-Sair")
      escreva("Opcao: ")
      lerInteiro(opcao)
      // opcoes 2 a 8 precisam de pelo menos 1 paciente
      se (opcao >= 2) e (opcao <= 8) e (qtd = 0) entao
         escreval("Nenhum paciente cadastrado.")
      senao
         escolha opcao
         caso 1
            cadastrar(qtd)
         caso 2
            listar(qtd)
         caso 3
            consultar(qtd)
         caso 4
            exibirFila(qtd)
         caso 5
            atender(qtd)
         caso 6
            exibirAtendidos(qtd)
         caso 7
            estatisticas(qtd)
         caso 8
            consultaRecursiva(qtd)
         caso 9
            escreval("Sistema encerrado.")
         outrocaso
            escreval("Erro: opcao inexistente.")
         fimescolha
      fimse
   ate opcao = OPCAO_SAIR
fimalgoritmo