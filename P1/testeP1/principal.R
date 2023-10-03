library(prova217517)

configuracoes <- yaml::read_yaml("config.yaml")

dados <- jsonlite::read_json(paste0("data/", configuracoes[["arquivo_entrada"]]),
                             simplifyDataFrame = TRUE)

saida <- df_variavel_2(dados, configuracoes[["nome_coluna"]])

save(saida, file = "results/arquivo_saida.RData")
