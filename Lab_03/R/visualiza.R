#' @importFrom ggplot2 ggplot aes geom_density facet_wrap theme_bw
#' @export
visualiza <- function(df){
  df$n <- as.factor(df$n)
  ggplot(df, aes(x = emv, color = n)) +
    geom_density() +
    facet_wrap(~lambda, scales = "free") +
    theme_bw() -> output
  plot(output)
  return(output)
}
