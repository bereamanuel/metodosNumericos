jsor <- function(A,b,x0,w,tol,maxiter){
  #Vamos a desarrollar el método de resolución de ecuaciones por método JSOR. 
  #INPUT:
  #    - A: Matriz del sistema lineal
  #    - b: Vector de términos independientes
  #    - x0: Estimación inicial del sistema
  #    - w: Parámetro de relajación. Debe estar en [0,1]
  #    - tol: Tolerancia de error cometido
  #    - maxiter: Número máximo de iteraciones en el método.
  #OUTPUT:
  #    - x: Solución del sistema
  #    - i: Número de iteraciones utilizadas.

i <- 1 
stop <- tol+1
n <- length(x0)
iM <- diag(diag(1/A),n,n)

while (i < maxiter && stop > tol){
    r <- b - A%*%x0
    x <- x0 + w*(iM%*%r)
    i <- i + 1
    stop <- ifelse(!identical(x0, matrix(rep(0,n), ncol=1)), norm(x-x0, type= "I")/norm(x0, type= "I"), stop)
    x0 <- x
}
return(x)

}

A <- matrix(c(4,3,0,3,4,-1,0,-1,4) , ncol=3)
b <- matrix(c(24,30,-24), ncol=1)
x0 <- matrix(c(0,0,0), ncol=1)
tol <- 10**(-7)
w <- 0.9
maxiter <- 100
jsor(A,b,x0,w,tol,maxiter)