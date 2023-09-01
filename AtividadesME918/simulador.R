simulador <- function(arg){
  
  if (!is.list(arg) || !all(c("distribution", "obs") %in% names(arg))) {
    stop("O argumento deve ser uma lista contendo 'distribution', 'parameters' e 'obs'.")
  }
  
  dist <- arg$distribution
  n <- arg$obs
  
  if (!(dist %in% c("normal", "poisson", "bernoulli"))) {
    stop("Distribuição não suportada. Escolha entre 'normal', 'poisson' ou 'bernoulli'.")
  }
  
  if (dist == "normal") {
    if (!all(c("mu", "sigma2") %in% names(arg))) {
      stop("Os parâmetros para normal devem incluir 'mu' e 'sigma2'.")
    }
    sample <- rnorm(n, arg$mu, arg$sigma2 ^ 0.5)
  }
  
  else if (dist == "poisson") {
    if (!all("lambda" %in% names(arg))) {
      stop("O parâmetro para poisson deve incluir 'lambda'.")
    }
    sample <- rpois(n, arg$lambda)
  }
  
  else if (dist == "bernoulli") {
    if (!all("p" %in% names(arg))) {
      stop("O parâmetro para bernoulli deve incluir 'p'.")
    }
    sample <- rbinom(n, 1, arg$p)
  }
  
  return(sample)
}