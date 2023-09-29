library(revisao217517)

leitura <- yaml::read_yaml("config.yaml")

funcao_3 <- get(leitura$nome_funcao_3)

funcao_3(iris, leitura$variavel_iris, leitura$tipo_grafico)
