heun<- function(f,a,b,y0,n){
  #Con esta función vamos a implementar el método de Heun
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
  
  y <- c(y0)
  
  for (k in seq(2,n+1)){
    k1 <- h*f(t[k-1],y[k-1])
    k2 <- h*f(t[k], y[k-1] + k1)
    y <- c(y, y[k-1] + k1/2 + k2/2 )
  }
  return(y)
}
  
f <- function (t,y){
  return( (1-2*t)*y  )
}


a <- 0
b <- 3
y0 <- 1

heun(f,a,b,y0,16)
  