#ETL - HISTOGRAM - SERVGUARD



#Captura de dados para o histograma:
#-----------------------------------------------------------------------------------------

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
  usoCpu = read.csv("C:/Users/cacay/Downloads", sep=",")
}


#-----------------------------------------------------------------------------------------
#Captura de dados para o histograma - Fim





#Definição das faixas e plotagem do histograma:
#-----------------------------------------------------------------------------------------
faixas <- seq(0, 100, by=10)
hist(usoCPU, breaks=faixas)
#-----------------------------------------------------------------------------------------
#Definição das faixas e plotagem do histograma - Fim





#Inserção dos dados no Banco:
#-----------------------------------------------------------------------------------------
#Capturando o valor da frequencia de cada faixa do histograma:
frequencias <- histograma$counts
faixas_inicio <- histograma$breaks[-length(histograma$breaks)]
faixas_fim <- histograma$breaks[-1]

if (escolhaBaseDeDados == "SQL") {
  #será necessário fazer um "insert" para cada coluna, por isso o "for"
  for (i in 1:length(frequencias)) {
    insert <- sprintf(
      "INSERT INTO cpu_histogram (year, month, range_start, range_end, frequency) 
      VALUES (%d, %d, %f, %f, %d);",
      2024, 10, faixas_inicio[i], faixas_fim[i], frequencias[i]
    
      #A ESTUDAR: Saber se tem uma funcao de auto_increment no mes e ano
    )
    #exectuar o insert
    dbExecute(conexao, insert)
  }
}
#-----------------------------------------------------------------------------------------
#Inserção dos dados no Banco - Fim

  



#SCRIPT DO BANCO:

#CREATE TABLE histograma (
#  id INT AUTO_INCREMENT PRIMARY KEY,

  #precisa de uma identificacao do componente!
  #aqui o ano e mes sao capturados da outra tabela
#  year INT NOT NULL,
#  month INT NOT NULL,

#  range_start INT NOT NULL,
#  range_end INT NOT NULL,
#  frequency INT NOT NULL
#);

#pensando em outro select
#select <- "SELECT range_start, range_end, frequency FROM cpu_histogram
#              WHERE dthCriacao > 2024-10-01 AND dthCriacao < 2024-10-31;"

