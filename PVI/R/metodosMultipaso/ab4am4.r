ab4am4 <- function(f,a,b,y0,n){
  #Vamos a definir el método predictor-corrector de 4 pasos. Utilizaremos:
  #AB4: Credictor
  #AM4: Corrector
  #Se trata de un método mixto.
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
  
  #Inicializamos la solución con la CI y utilizamos Runge-Kutta, para encontrar y1 e y2
  y <- t(matrix(0,2,n+1))
  y[1,] <- t(y0)
  yp <- t(matrix(0,2,n+1))
  yp[1,] <- t(y0)
  
  for (k in seq(2,4)){
    k1 <- f(t[k-1],y[k-1,])
    k2 <- f(t[k-1] + h/2, y[k-1,] + (h*k1)/2)
    k3 <- f(t[k-1] + h/2, y[k-1,] + (h*k2)/2)
    k4 <- f(t[k],y[k-1,] + h*k3)
    y[k,] <- y[k-1,] + h/6 *(k1 + 2*k2 + 2*k3 + k4 ) 
    yp[k,] <- y[k-1,] + h/6 *(k1 + 2*k2 + 2*k3 + k4 ) 
  }
  
  for (k in seq(5,n+1)){
    yp[k,] <- y[k-1,]+h/24*(55*f(t[k-1],y[k-1,]) -59*f(t[k-2],y[k-2,]) + 37*f(t[k-3],y[k-3,]) -9*f(t[k-4],y[k-4,]))
    y[k,] <- y[k-1,] + h/24*(f(t[k-3],y[k-3,]) -5*f(t[k-2],y[k-2,]) +19*f(t[k-1],y[k-1,]) + 9*f(t[k],yp[k,])) 
  }
  return(y)
}

f <- function (t,Y){
  F <- cbind(c(0,(9.81/0.5)),c(1,0)) %*% Y
  return( F )
}

a <-  0
b <-  2
n <-  10
y0 <- rbind(c(0),c(0.25))

ab4am4(f,a,b,y0,n)


