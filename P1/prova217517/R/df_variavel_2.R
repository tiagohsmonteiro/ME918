#' @title Data Frame com variável ao quadrado
#'
#' @param df Um objeto do tipo `Data.Frame`
#' @param variavel O nome de uma coluna do `Data.Frame` especificado em `df`, que seja do tipo `numeric` ou `integer`
#'
#' @return Um Data Frame com mesmas colunas, porém com a coluna `variavel` elevada ao quadrado
#'
#' @examples
#' df_variavel_2(iris, "Sepal.Length")
#' df_variavel_2(iris, "Petal.Width")
#'
#' @export
df_variavel_2 <- function(df, variavel) {

  if (!(variavel %in% names(df))){
    stop("'variavel' não encontrada em 'df'")
  }

  if (!(is.numeric(df[[variavel]]) == TRUE | is.integer(df[[variavel]]) == TRUE)){
    stop("'variavel' não é do tipo 'numeric' ou 'integer'")
  }

  df[[variavel]] <- df[[variavel]]^2

  return(df)
}
