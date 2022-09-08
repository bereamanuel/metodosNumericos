sor <- function(A,b,x0,w,tol,maxiter){
  #Vamos a desarrollar el método de resolución de ecuaciones por método SOR. 
  #INPUT:
  #    - A: Matriz del sistema lineal
  #    - b: Vector de términos independientes
  #    - x0: Estimación inicial del sistema
  #    - tol: Tolerancia de error cometido
  #    - maxiter: Número máximo de iteraciones en el método.
  #OUTPUT:
  #    - x: Solución del sistema
  #    - i: Número de iteraciones utilizadas.
  
  k <- 1 
  stop <- tol+1
  n <- length(x0)
  
  U <- A
  U[lower.tri(U, diag = TRUE)] <- 0
  D <- diag(diag(A),n,n)
  L <- A
  L[upper.tri(L, diag = TRUE)] <- 0
  
  M <- D + w*L 
  N <- (-w*U + (1-w)*D)
  while (k < maxiter && stop > tol){
    x <- matrix(0,n,1)
    d <- w*b + N%*%x0
    B <- M
    x[1] <- d[1]/M[1,1]
    for (i in seq(2,n)){
      s <- 0
      for (j in seq(1, n-1)){
        s <- s + B[i,j]*x[j]
      }
      x[i] <- (d[i]-s)/B[i,i]
    }
    stop <- ifelse(!identical(x0, matrix(rep(0,n), ncol=1)), norm(x-x0, type= "I")/norm(x0, type= "I"), stop)
    k <- k+1
    x0 <- x
  }
  return(x)
}

A <- matrix(c(4,3,0,3,4,-1,0,-1,4), ncol = 3)
b <-  matrix(c(24,30,-24), ncol = 1)
x0 <-  matrix(c(0,0,0), ncol = 1)
tol <- 10**(-7)
w <- 1.25
maxiter <- 100

sor(A,b,x0,w,tol,maxiter)
