gaussChebyshev <- function(f, a, b, n){
  ## Método de cuadratura de Gauss-Chebyshev
  # Debemos tener en cuenta que la función peso es w(x) = 1/sqrt(1-x**2)
  # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [-1,1]
  # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
  # INPUT
  # f: función a integrar
  # a: Inicio del intervalo de integración
  # b: Fin del intervalo de integración
  # n: Número de nodos que queremos utilizar para la estimación.
  source("Polinomios\\R\\chebyshev.r")
  xi <- rootsChebyshev(n)
  ci <- coefChebyshev(n)
  k <- length(xi)
  if (sum(c(a,b) == c(-1,1)) == 2 ){
    I <- 0
    for (i in seq(1,k)){
      I <- I + ci[i]*f(xi[i])
    }
    return(I)
  }else{
    print("El intervalo no está bien definido")
  }
}

f <- function(x)  exp(x)
a <- -1
b <- 1
n <- 5
er <- 10**(-6)

gaussChebyshev(f, a, b, n)

gaussChebyshevError <- function(f, a, b, er){
  ## Método de cuadratura de Gauss-Chebyshev
  # Debemos tener en cuenta que la función peso es w(x) = 1/sqrt(1-x**2)
  # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [-1,1]
  # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
  # En esta variación, vamos a buscar n para que el error sea menor que e.
  # INPUT
  # f: función a integrar
  # a: Inicio del intervalo de integración
  # b: Fin del intervalo de integración
  # e: Cota de error.
  source("Polinomios\\R\\chebyshev.r")
  n <- 1
  ei <- abs( ((2*pi)/(2**(2*n)*factorial(2*n)))*(exp(1)) )
  if (sum(c(a,b) == c(-1,1)) == 2 ){
    while (abs(er) < ei ){
      n <- n + 1
      ei <- abs( ((2*pi)/(2**(2*n)*factorial(2*n)))*(exp(1)) )
    }
    xi <- rootsChebyshev(n)
    ci <- coefChebyshev(n)
    k <- length(xi)
    I <- 0
    for (i in seq(1,k)){
      I <- I + ci[i]*f(xi[i])
    }
    return(c("n"= n , "I" = I, "e" = er))
  }else{
    print("El intervalo no está bien definido")
  }
}


gaussChebyshevError(f, a, b, er)