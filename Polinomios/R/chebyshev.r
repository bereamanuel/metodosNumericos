chebyshev <- function(x, n){
  #Función que nos devuelve el valor del polinomio de Chebyshev de grado n en un punto x
  if (n == 0) { 
    return(1)
  }else if (n == 1){
    return(x)
  }else{
    return( 2*x*chebyshev(x, n-1) - chebyshev(x, n-2) )
  }   
}
rootsChebyshev <- function(n){
  # Esta función nos devuelve las raices del polinomio de Chebyshev de grado n 
  xi <- c()
  for (k in seq(1,n)){
    xi <- c(xi, cos((pi/2)*((2*k+1)/n)) )
  }
  return (xi)
}
coefChebyshev <- function(n){
  # Esta función nos devuelve los coeficientes del polinomio de grado n, para la cuadratura de G-C
  return(rep(pi/n,n))
}

#Necesitamos estas funciones para poder hacer la cuadratura de Gauss-Legrendre
n <- 3
rootsChebyshev(n)
coefChebyshev(n)