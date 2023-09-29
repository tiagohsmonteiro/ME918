#' @title Gráfico de densidade ou histograma
#'
#' @param df Um objeto do tipo Data.Frame.
#' @param variavel Uma coluna do Data.Frame especificado em df.
#' @param tipo  Uma string sendo "densidade" ou "histograma".
#'
#' @return Um gráfico do `ggplot` de densidade ou histograma de `variavel`
#'
#' @examples
#' visualiza(iris, "Sepal.Length", "densidade")
#' visualiza(iris, "Sepal.Width", "histograma")
#'
#'
#' @importFrom ggplot2 ggplot aes geom_density geom_histogram labs theme_classic
#' @export
visualiza <- function(df, variavel, tipo = c("densidade", "histograma")){
  if (!(variavel %in% names(df))){
    stop("'variavel' não encontrada em 'df'")
  }

  if (is.numeric(df[[variavel]]) == FALSE){
    stop("'variavel' não é do tipo 'numeric'")
  }

  if (!(tipo %in% c("densidade", "histograma"))){
    stop("'tipo' deve ser 'densidade' ou 'histograma'")
  }

  if (tipo == "densidade"){
    output <- ggplot(df, aes(x = df[[variavel]])) +
      geom_density() +
      labs(x = variavel, title = paste0("Densidade de ", variavel)) +
      theme_classic()
  } else{
    output <- ggplot(df, aes(x = df[[variavel]])) +
      geom_histogram() +
      labs(x = variavel, title = paste0("Histograma de ", variavel)) +
      theme_classic()
  }

  return(output)
}
