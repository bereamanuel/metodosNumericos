eulerI <- function(f,df,a,b,y0,n,tol,maxiter){
  
    #Con esta función vamos a implementar el método de Euler implicito
    #INPUT:
    #    f:  Función de entrada
    #    a:  Inicio del intervalo
    #    b:  Fin del intervalo
    #    y0: Condición inicial
    #    n:  Número de subintervalos
    #    tol: Tolerancia del método del punto fijo
    #    maxiter: maximas iteraciones permitidas
    #OUTPUT:
    #    t: Vector de puntos desde a hasta b con paso h 
    #    y: Vector solucion en cada instante t
    
  
  h <- (b-a)/n
  t <- seq(a,b,h)
  
  y <- c(y0)
  
  for (k in seq(0,n)){
    x0 <- c(k)
    i <- 1
    dif <- tol+1
    condition <- TRUE
    while (condition){
      fx0 <- f(t[k+1],x0)
      dfx0 <- df(t[k+1],x0)
      g <- x0-y[k]-h*fx0
      dg <- 1-h*dfx0
      x1 <- x0 - g/dg
      dif <- abs(x1-x0)
      i <- i + 1
      x0 <- x1
      if (i > iter){
        condition <- FALSE
      } else if ( !isTRUE(dif - tol < 0) ){
        condition <- FALSE
      }
    }
    y <- c(y,y[k]+h*f(t[k+1],x0))
  }
  return(y)
}

f <- function (t,y){
  return( -10*y )
}

df <- function(t,y){
  return( -10 )
}
a <- 0
b <- 3
y0 <- 1
tol <- 10**(-6)
iter <- 50

eulerI(f,df,a,b,y0,4,tol,iter)
