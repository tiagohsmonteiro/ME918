# FUNÇÃO 1

# Considere a seguinte vetor de strings com afirmações sobre a linguagem R:

afirmacoes <- c(
  "Documentações de funções não podem ser criadas sem o pacote roxygen2.",
  "Funções sempre precisam retornar algum objeto.",
  "Podemos salvar objetos do R, como vetores numéricos e funções, no formato YAML.",
  "A função 'lm', utilizada para ajuste de regressão linear, não faz parte de nenhum pacote.",
  "Não existe diferença entre os operadores '=' e '<-' para atribuição de variáveis."
)

#   A primeira função deve ter um argumento chamado verdadeiro, que receberá os valores TRUE ou FALSE.
#   Caso o valor de verdadeiro seja TRUE, a função deve retornar todas as afirmações verdadeiras. Caso o valor
#   de verdadeira seja FALSE, a função deve retornar todas as funções falsas.

#' @export
verifica <- function(verdadeiro){

  verficiacao <- c(FALSE, FALSE, FALSE, FALSE, TRUE)

  if (verdadeiro == TRUE){
    return(afirmacoes[which(verficiacao)])
  }
  else if (verdadeiro == FALSE){
    return(afirmacoes[which(verficiacao == FALSE)])
  }
  else{
    stop("argumento deve ser TRUE ou FALSE")
  }
}
