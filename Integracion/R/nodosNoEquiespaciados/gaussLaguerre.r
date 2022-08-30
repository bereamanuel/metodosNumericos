gaussLaguerre <- function(f, n , k = 1){
  ## Método de cuadratura de Gauss-Laguerre
  # Debemos tener en cuenta que la función peso es w(x) = exp(-x)
  # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [0,+inf]
  # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
  # INPUT
  # f: función a integrar
  # n: Número de nodos que queremos utilizar para la estimación.
  # k: Constante que aparece si hacemos cambios de variable
  source("Polinomios\\R\\laguerre.r")
  coefs <- coefLaguerre(n)
  I <- 0
  for (i in seq(1,n)){
    I <- I + coefs[paste0("ci",as.character(i))]*f(coefs[paste0("roots",as.character(i))]) 
  }
  return(I*k)
}

f <- function(x)  sin(x/10)
n <- 5
k <- 1/10

gaussLaguerre(f, n , k)