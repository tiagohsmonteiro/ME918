# 1. É possível utilizar uma função de um pacote sem carregá-lo pela função library().
# 2. Cada arquivo .R em um pacote só pode conter uma única função.
# 3. Um pacote pode não exportar nenhuma função em seu “NAMESPACE”.
# 4. Ao utilizar o pacote roxygen2 para criar documentações, cada função do pacote terá um arquivo .Rd
# de documentação correspondente, em uma relação um pra um.

afirmacoes <- list(
  list(verdadeiro = TRUE),
  list(verdadeiro = FALSE,
       justificativa = "É possível criar mais de uma função em um Rscript, no caso em que esta é auxiliar da função principal, por exemplo."),
  list(verdadeiro = TRUE),
  list(verdadeiro = TRUE)
)

#' @export
resposta <- function(){
  return(afirmacoes)
}
