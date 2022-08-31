simpsonD <- function(f,a,b,c,d,n,m){
  # Fórmula de Simpson Doble
  # INPUTS:
  # f(x,y): función a integrar 
  # a: Inicio del intervalo en x
  # b: Fin del intervalo en x
  # n: Número de subintervalos en x
  # c: Inicio del intervalo en y
  # d: Fin del intervalo en y
  # m: Número de subintervalos en y
  
  h <- (b-a)/n
  k <- (d-c)/m
  
  x <- seq(a,b,h)
  y <- seq(c,d,k)
  
  #Construimos la matriz de pesos
  w1 <- c(1 ,rep(c(2,4),n-1)[1:m-1], 1)
  w2 <- c(4 ,rep(c(16,8),n-1)[1:m-1], 4)
  w3 <- c(2 ,rep(c(8,4),n-1)[1:m-1], 2)
  w  <- c(w1, c(rep(c(w2,w3),(n/2)-1),w2), w1 )
  w  <- matrix(w, ncol = n+1, byrow = T)
  
  #Calculamos la integral
  I <- 0
  for (i in seq(1,n+1)){
    for (j in seq(1,m+1)){
      I <- I + f(x[i],y[j])*w[i,j]
    }
  }
  I <- ((h*k)/9)*I
  return( I )
}


f <- function(x,y){
  return( sqrt( (x**2 + y**2)/(9 - x**2 - y**2) ) )
}
a <- 0
b <- 1
c <- 0
d <- 1
n <- 8
m <- 8

print(simpsonD(f,a,b,c,d,n,m))