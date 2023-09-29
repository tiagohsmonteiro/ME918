# Crie uma função que retorne uma string (texto de 1 parágrafo), que responda a seguinte pergunta:
#   • Quais as vantagens e em que casos devemos organizar nossos códigos R em forma de pacotes?

#' @export
resposta <- function(){
  return(paste0("Quando estamos interessados em reutilizar funções com certa frequência",
                ", ou quando estamos desenvolvendo algum produto para terceiros, a criação",
                " de um pacote pode se mostrar bastante útil."))
}
