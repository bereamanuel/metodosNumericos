am4 <- function(f,df,a,b,y0,n,N){
  
  #Vamos a definir el método de Adams-Moulton de 4 pasos 
  #Se trata de un método implícito.
  #Input:
  #    - f: EDO que queremos resolver
  #    - a: Inicio del intervalo
  #    - b: Fin del intervalo
  #    - y0: Condición inicial
  #    - n: Número de intervalos que utilizaremos.
  #    - N: Número de pasos
  #Output:
  #    - y: Solución
  
  h <- (b-a)/n
  t <- seq(a,b,h)
  y <- c(y0)
  
  for (k in seq(1,2)){
    k1 <- f(t[k],y[k])
    k2 <- f(t[k] + h/2, y[k] + (h*k1)/2)
    k3 <- f(t[k] + h/2, y[k] + (h*k2)/2)
    k4 <- f(t[k],y[k] + h*k3)
    y <- c(y,y[k] + h/6 *(k1 + 2*k2 + 2*k3 + k4 ) )
  }
  
  maxiter <- 10
  tol <- 10**(-6)
  for (k in seq(3, n)){
    fk <- f(t[k], y[k])
    fkm1 <- f(t[k-1], y[k-1])
    fkm2 <- f(t[k-2], y[k-2])
    i <- 1
    dif <- 1 
    x0 <- y[k]
    condition <- TRUE
    while (condition){
      fx0 <- f(t[k+1],x0)
      dfx0 <- df(t[k+1],x0)
      g <- x0-y[k]-h/24*(fkm2-5*fkm1+19*fk +9*fx0)
      dg <- 1-h/24*9*dfx0
      x1 <- x0 - g/dg
      dif <- abs(x1-x0)
      i <- i + 1
      x0 <- x1
      if (i > maxiter){
        condition <- FALSE
      } else if ( !isTRUE(dif - tol < 0) ){
        condition <- FALSE
      }
    }
    y <- c(y,y[k] + h/24*(fkm2-5*fkm1+19*fk +9*f(t[k+1],x0)))
    
  }
  return(y)
}
f <- function(t,y){
  return((1-2*t)*y)
}

df <- function(t,y){
  return(1-2*t)
}

a <- 0
b <- 3
y0 <- 1
n <- 16

am4(f,df,a,b,y0,n)