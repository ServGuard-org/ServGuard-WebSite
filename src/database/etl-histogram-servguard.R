#ETL - HISTOGRAM - SERVGUARD



#Captura de dados para o histograma:
#-------------------------------------------------------------------------------
# escolhaBaseDeDados <- "SQL"
escolhaBaseDeDados <- "CSV"

if (escolhaBaseDeDados == "SQL") {
  
  #Pacote para acessar dinamicamente o banco de dados:
  install.packages("RMySQL") 
  
  conexao <- dbConnect(RMySQL::MySQL(),
                       dbname = "ServGuard",
                       host = "127.0.0.1",
                       port = 3306,
                       user = "root",
                       password = "urubu100")
  
  #Variavel com o select do banco:
  select <- "" #colocar a view aqui
  
  #Chamar o select e transformar os dado recebidos em uma variavel:
  usoCpu <- dbGetQuery(conexao, select)
  
} else {
  #colocar o codigo de captura dos dados por CSV aqui
  captura <- read.csv("C:/Users/cacay/Downloads/dados-pc.csv", sep=",")
  str(captura)
  
  #Remove o "%" caso exista na coluna
  usoCPU <- as.numeric(gsub("%", "", captura$CPU))  
  #Teste com valores fictícios
  usoCPU <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100,100)  
}
#-------------------------------------------------------------------------------
#Captura de dados para o histograma - Fim





#Definição das faixas e plotagem do histograma:
#-------------------------------------------------------------------------------
faixas <- seq(0, 100, by=10)
histograma <- hist(usoCPU, #Dados utilizados
                   breaks=faixas, #Faixas de 10 em 10 %
                   freq=TRUE, 
                   right = FALSE, #Extende o y a maior frequencia histograma
                   xlim = c(0,100))#Fixa o valor de 0 a 100 na exibição 

#Capturando o valor da frequencia de cada faixa do histograma:
frequencias <- histograma$counts]

#utilizando duas tabelas basta pegar os breaks apenas
faixas_inicio <- histograma$breaks[-length(histograma$breaks)]
faixas_fim <- histograma$breaks[-1]
#-------------------------------------------------------------------------------
#Definição das faixas e plotagem do histograma - Fim





#Inserção dos dados no Banco:
#-----------------------------------------------------------------------------------------
if (escolhaBaseDeDados == "SQL") {
  
  #Captura do mês e ano atual para o insert:
  ano_atual <- as.numeric(format(Sys.Date(), "%Y"))
  mes_atual <- as.numeric(format(Sys.Date(), "%m"))
  
  #Será necessário fazer um "insert" para cada coluna, por isso o "for"
  for (i in 1:length(frequencias)) {
    insert <- sprintf(
      "INSERT INTO cpu_histogram (year, month, range_start, range_end, frequency) 
      VALUES (%d, %d, %f, %f, %d);",
      ano_atual, mes_atual, faixas_inicio[i], faixas_fim[i], frequencias[i]
    )
    #exectuar o insert
    dbExecute(conexao, insert)
  }
}
#-------------------------------------------------------------------------------
#Inserção dos dados no Banco - Fim

  



#SCRIPT DO BANCO:

#CREATE TABLE histograma (
#  id INT AUTO_INCREMENT PRIMARY KEY,

  #precisa de uma identificacao do componente!
#  year INT NOT NULL,
#  month INT NOT NULL,

#  range_start INT NOT NULL,
#  range_end INT NOT NULL,
#  frequency INT NOT NULL
#);

#pensando em outro select
#select <- "SELECT range_start, range_end, frequency FROM cpu_histogram
#              WHERE dthCriacao > 2024-10-01 AND dthCriacao < 2024-10-31;"

