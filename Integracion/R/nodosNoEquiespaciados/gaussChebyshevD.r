gaussChebyshev <- function(f, a, b, c, d, n, m){
  ## Método de cuadratura de Gauss-Chebyshev doble
  # Debemos tener en cuenta que la función peso es w(x) = 1/sqrt(1-x**2)
  # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [-1,1]
  # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
  # INPUT
  # f(x,y): función a integrar 
  # a: Inicio del intervalo en x
  # b: Fin del intervalo en x
  # n: Número de subintervalos en x
  # c: Inicio del intervalo en y
  # d: Fin del intervalo en y
  # m: Número de subintervalos en y
  source("Polinomios\\R\\chebyshev.r")
  xi <- rootsChebyshev(n)
  yi <- rootsChebyshev(m)
  
  cn <- coefChebyshev(n)
  cm <- coefChebyshev(m)
  
  k1 <- length(xi)
  k2 <- length(yi)
  if ((sum(c(a,b) == c(-1,1)) == 2 ) & (sum(c(c,d) == c(-1,1)) == 2 )){
    I <- 0
    for (i in seq(1,k1)){
      for (j in seq(1,k2)){
        I <- I + cn[i]*cm[j]*f(xi[i],yi[j])
      }
    }
    return(I)
  }else{
    print("El intervalo no está bien definido")
  }
}

f <- function(x,y)  exp(x+y)
a <- -1
b <- 1
c <- -1
d <- 1
n <- 5
m <- 5

gaussChebyshev(f, a, b, n)
