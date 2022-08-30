gaussHermite <- function(f, n , k = 1){
  ## Método de cuadratura de Gauss-Hermite
  # Debemos tener en cuenta que la función peso es w(x) = exp(-x)
  # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [0,+inf]
  # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
  # INPUT
  # f: función a integrar
  # n: Número de nodos que queremos utilizar para la estimación.
  # k: Constante que aparece si hacemos cambios de variable
  source("Polinomios\\R\\hermite.r")
  coefs <- coefHermite(n)
  I <- 0
  for (i in seq(1,n)){
    I <- I + coefs$ci[i]*f(coefs$roots[i]) 
  }
  return(I*k)
}

f <- function(x) abs(x)
n <- 4
k <- 1/4


gaussHermite(f, n , k)