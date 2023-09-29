#' @export
experiment_pois <- function(config_list){
  lista_experimentos <- purrr::map(config_list, function(x){
      df <- list_rpois(x$n, x$n_replicas, x$lambda) |> emv_df()
      df$n <- x$n
      df$lambda <- x$lambda
      return(df)
    })

  return(dplyr::bind_rows(lista_experimentos, .id = "exper"))
}
