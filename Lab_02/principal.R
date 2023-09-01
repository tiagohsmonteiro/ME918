library(yaml)
library(jsonlite)
library(purrr)
library(ggplot2)
library(dplyr)
library(lubridate)

# Parte 02

arquivos <- read_yaml("configuracoes.yaml")

dados <- map(arquivos, function(x) read_json(paste0("dados/", x)))
dados <- do.call(c, dados)

# Parte 03

dados_dfl <- map(dados, data.frame)
dados_df <- list_rbind(dados_dfl)

# Parte 04
  
dados_df$horario <- ymd_hms(dados_df$horario)

dados_df %>% 
  filter(evento == "recalibragem") %>% 
  mutate(contagem = cumsum(rep(1, length(horario)))) %>% 
  ggplot(aes(x = horario, y = contagem)) +
  geom_point() 

horarios <- dados_df %>% 
  filter(evento == "recalibragem") %>% 
  mutate(diferenca = horario - lag(horario)) %>% 
  mutate(maior_que_8 = ifelse(diferenca > 8*60*60, TRUE, FALSE)) %>% 
  filter(maior_que_8 == TRUE) %>% 
  select(horario)

recalibragem <- dados_df %>% filter(evento == "recalibragem")

horarios_ant <- ymd_hms()
for (i in seq(length(horarios$horario))) {
  horarios_ant[i] = max(recalibragem$horario[recalibragem$horario < horarios$horario[i]])
}

dados_df <- dados_df %>% 
  filter(!(horario < horarios$horario[1] & horario > horarios_ant[1])) %>% 
  filter(!(horario < horarios$horario[2] & horario > horarios_ant[2]))

# Parte 05

combin <- expand.grid(v1 = c(T,F), v2 = c(T,F), v3 = c(T,F), v4 = c(T,F))
l <- unlist(apply(combin, 1, list), recursive = FALSE)
variaveis <- lapply(l, function(x) names(x)[x])

regressao <- function(variaveis) {
  if (length(variaveis) < 1) {
    df <- dados_df[,"intensidade",drop=FALSE]
  } else {
    df <- dados_df %>% select("intensidade", variaveis)
  }
  
  lm(intensidade ~ ., df)
}

map(variaveis, function(x) regressao(x))