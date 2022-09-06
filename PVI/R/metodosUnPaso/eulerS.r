eulerS<- function(f,a,b,y0,n){
  #Con esta función vamos a implementar el método de Euler Explícito para sistemas
  #INPUT:
  #    f:  Función de entrada
  #    a:  Inicio del intervalo
  #    b:  Fin del intervalo
  #    y0: Condición inicial
  #    n:  Número de subintervalos
  #OUTPUT:
  #    y: Vector solucion en cada instante t
  
  h <- (b-a)/n
  t <- seq(a,b,h)
  y <- t(matrix(0,2,n+1))
  y[1,] <- t(y0)
  
  for (k in seq(2,n+1)){
    y[k,] <- y[k-1,] + h*f(t[k-1],y[k-1,])
  }
  return(y)
}

f <- function (t,Y){
  F <- cbind(c(3,4),c(2,1)) %*% Y
  return( F + rbind( c(-(2*(t**2) + 1)*exp(2*t)), c((t**2 + 2*t + -4)*exp(2*t)) ))
}


n<- 10
a <- 0
b <- 1
y0 <- rbind(c(1),c(1))


eulerS(f,a,b,y0,10)
