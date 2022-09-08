jacobi <- function(A,b,x0,tol,maxiter){
  #Vamos a desarrollar el método de resolución de ecuaciones por método Jacobi. 
  #INPUT:
  #    - A: Matriz del sistema lineal
  #    - b: Vector de términos independientes
  #    - x0: Estimación inicial del sistema
  #    - tol: Tolerancia de error cometido
  #    - maxiter: Número máximo de iteraciones en el método.
  #OUTPUT:
  #    - x: Solución del sistema
  #    - i: Número de iteraciones utilizadas.
  
  i <- 1 
  stop <- tol+1
  U <- A
  U[lower.tri(U, diag = TRUE)] <- 0
  D <- diag(diag(A),4,4)
  L <- A
  L[upper.tri(L, diag = TRUE)] <- 0
  iM <- diag(diag(1/A),4,4)
  N <- -(L+U)
  
  while (i < maxiter && stop > tol){
    x <- (iM%*%N)%*%x0 + iM%*%b
    i <- i + 1
    stop <- ifelse(!identical(x0, matrix(c(0,0,0,0), ncol=1)), norm(x-x0, type= "I")/norm(x0, type= "I"), stop)
    x0 <- x
  }
  return(x)
}

A <- matrix(c(10 , -1, 2, 0,-1, 11,-1,3,2,-1,10,-1,0,3,-1,8), ncol = 4)
b <-  matrix(c(6,25,-11,15), ncol = 1)
x0 <-  matrix(c(0,0,0,0), ncol = 1)
tol <- 10**(-3)
maxiter <- 100

jacobi(A,b,x0,tol,maxiter)
