legendre <- function(x, n){
  #Función que nos devuelve el valor del polinomio de legrendre de grado n en un punto x
  if (n == 0){ 
    return(1)
  }else if (n == 1){ 
    return(x)
  }else{
    return( (1/n)*((2*(n-1)+1)*x*legendre(x,n-1) - (n-1)*legendre(x,n-2)) )
  }
}

rootsLegendre <- function(n){
  #Esta función nos devuelve las raices del polinomio de legrendre de grado n 
  xi <- c()
  for (k in seq(1,n)) {
    xi <- c((1 - (1/(8*n^2)) + (1/(8*n^3)))*cos(pi *((4*k - 1)/(4*n+2))), xi)
  }
  return (xi)
}

coefLegendre <- function(n){
  # Esta función nos devuelve los coeficientes del polinomio de grado n, para la cuadratura de G-L
  
  xi <- rootsLegendre(n)
  #Utilizamos la relacción de recurrencia para calcular el valor de la derivada en x
  dxi <- c()
  for (x in xi){
    dxi <-c( 1/(1-(x**2))*((n+1)*x*legendre(x,n) - (n+1)*legendre(x,n+1) ) , dxi)
  }
  #Calculamos los coeficientes
  ci <- c()
  for (i in seq(1,length(xi))){
    ci <- c( 2/((1-(xi[i]^2))*((dxi[i]))^2), ci )
  }
  return(ci)
}

