library("polynom")

hermite  <- function(xi,fi,dfi){
  col  <-  2
  p  <-  fi[1]
  vx  <-  1
  z  <- c()
  F  <- c()
  for (i in seq(1,length(xi))) {
    z <- c(z, xi[i], xi[i])
    F <- c(F, fi[i], fi[i])
  }
  n  <-  length(z)
  DD  <- matrix(0,n,n)
  DD[1:n,1]  <- F
  for (j in seq(2,n)){
    if (j%%2 == 1){
      DD[j,2] = (DD[j,1] - DD[j-1,1])/(z[j]-z[j-1])
    } else {
      DD[j,2] = dfi[j/2]
    }
  }
  for (k  in  seq(3,n)){
    for (j  in  seq(k,n)) {
      DD[j,k]=(DD[j,k-1]-DD[j-1,k-1])/(z[j]-z[j-k+1])
    }
  }
  # ¿Porqué cambia los coeficientes del polinomio?
  # la librería tiene un bug.
  while (col<=n) {
    vx  <- as.polynomial(c(-z[col-1], vx))
    p  <-  p + DD[col,col]*vx
    col  <- col+1
  }
  coef <-  diag(DD)
  list(coef = summary(p), p= p)
}
xi  <- c(0,0.5,1)
fi  <- c(1,0.9385,0.7652)
dfi <- c(0,-0.2423,-0.44019)


hermite(xi,fi, dfi)
