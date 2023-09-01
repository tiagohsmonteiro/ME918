source("executa.R")

dir <- getwd()

for (i in 1:length(planos)){
  simulacao <- planos[[i]]
  simulacao$result <- amostra[[i]]
  
  if (i < 10) {
    save(simulacao, file = paste0(dir, "/resultados/simulacao0", i, ".RData"))
  }
  else {
    save(simulacao, file = paste0(dir, "/resultados/simulacao", i, ".RData"))
  }
}
