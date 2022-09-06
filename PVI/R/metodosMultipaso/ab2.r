ab2 <- function(f,a,b,y0,n){
  
  #Vamos a definir el método de Adams-Bashforth de 2 pasos 
  #Se trata de un método explícito. Como conocemos un punto inicial
  #y necesitamos y0 e y1, y2,...
  #que normalmente, será del mismo orden. En nuestro caso, vamos a utilizar Runge-Kutta.
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
  y <- t(matrix(0,2,n+1))
  y[1,] <- t(y0)


  k1 <- h*f(t[k-1],y[1,])
  k2 <- h*f(t[k], y[1,] + k1)
  y[2,] <-  y[1,] + k1/2 + k2/2 
  
  for (k in seq(3,n+1)){
      y[k,] <- y[k-1,]+ (3*h*f(t[k-1],y[k-1,]))/2 - (h*f(t[k-2],y[k-2,]))/2
  }
  return(y)
}


f <- function (t,Y){
  F <- cbind(c(0,(9.81/0.5)),c(1,0)) %*% Y
  return( F )
}

a = 0
b = 2
n = 10
y0 <- rbind(c(0),c(0.25))

ab2(f,a,b,y0,n)


