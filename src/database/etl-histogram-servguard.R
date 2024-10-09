#ETL - HISTOGRAM - SERVGUARD

#Pacote para acessar dinamicamente o banco de dados
install.packages("RMySQL") 

conexao <- dbConnect(RMySQL::MySQL(),
                 dbname = "ServGuard",
                 host = "127.0.0.1",
                 port = 3306,
                 user = "root",
                 password = "urubu100")


#select provisório
select <- "SELECT range_start, range_end, frequency FROM cpu_histogram
              WHERE year = 2024 AND month = 10;" #colocar a view aqui

#transformar em variavel os dados de CPU
usoCpu <- dbGetQuery(conexao, select)

#definição das faixas do histograma e geração do mesmo
faixas <- seq(0, 100, by=10)
hist(usoCPU, breaks=faixas)

#dados para inserir no banco:
frequencias <- histograma$counts
faixas_inicio <- histograma$breaks[-length(histograma$breaks)]
faixas_fim <- histograma$breaks[-1]

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

