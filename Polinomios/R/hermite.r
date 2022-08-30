hermite <- function(x, n){
  # Función que nos devuelve el valor del polinomio de Hermite de grado n en un punto x
  
  if (n == 0){
    return(1)
  }else if (n == 1) {
    return(2*x)
  }else{
    return( 2*x*hermite(x,n-1) - 2*(n-1)*hermite(x,n-2) )
  }
}


# install.packages("orthopolynom")
coefHermite <- function(n){
  #Esta función nos calcula los coeficientes del polinomio de Hermite de grado n, además las raices de dicho polinomio.
  #Por último, nos devuelve los ci que utilizamos para poder aplicar el método de cuadratura de Gauss-Laguerre.
  library(orthopolynom)
  p <- as.function(hermite.h.polynomials(n=n)[[n+1]])
  p1 <- as.function(hermite.h.polynomials(n=n-1)[[n]])
  ai <- hermite.h.polynomials(n=n)[[n+1]]
  ri <- polyroot(hermite.h.polynomials(n=n)[[n+1]])
  ci <- c()
  for (r in ri){
    ci <- c(ci, ((2**(n-1))*factorial(n)*sqrt(pi))/((n**2)*(p1(r))**2) )
  }
  
  return(c("ai"= list(ai), "roots"= list(ri),"ci" = list(ci)))
}
#Necesitamos estas funciones para poder hacer la cuadratura de Gauss-Leguerre.
n = 4

print(coefHermite(n))