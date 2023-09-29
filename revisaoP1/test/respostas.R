library(revisao217517)

leitura <- yaml::read_yaml("config.yaml")

funcao_1 <- get(leitura$nome_funcao_1)
funcao_2 <- get(leitura$nome_funcao_2)

print(funcao_1(TRUE))
print(funcao_2())
