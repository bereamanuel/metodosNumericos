gaussHermiteD <- function(f,n,m,kn =1,km=1){
  ## Método de cuadratura de Gauss-Hermite
  # Debemos tener en cuenta que la función peso es w(x) = exp(-x)
  # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [0,+inf]
  # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
  # INPUT
  # f: función a integrar
  # n: Número de nodos que queremos utilizar para la estimación.
  # k: Constante que aparece si hacemos cambios de variable
  source("Polinomios\\R\\hermite.r")
  coefsN <- coefHermite(n)
  coefsM <- coefHermite(m)

  I <- 0
  for (i in seq(1,n)){
    for (j in seq(1,m)){
      I <- I + coefsN$ci[i]*coefsM$ci[j]*f(coefsN$roots[i], coefsM$roots[j]) 
    }
  }
  return(I*kn*km)
}

f <- function(x,y) abs(x+y)
n <- 30
m <- 30
kn <- 1/4
km <- 1/4


gaussHermiteD(f,n,m,kn,km)