library("polynom")

newton  <- function(xi,fi){
  n  <-  length(xi)
  col  <-  2
  p  <-  fi[1]
  vx  <-  1
  DD  <- matrix(0,n,n)
  DD[1:n,1]  <- fi
  for (k  in  seq(2,n)){
    for (j  in  seq(k,n)) {
      DD[j,k]=(DD[j,k-1]-DD[j-1,k-1])/(xi[j]-xi[j-k+1])
    }
  }
  while (col<=n){
    vx  <- as.polynomial(c(-xi[col-1], vx))
    p  <-  p+DD[col,col]*vx
    col  <- col+1
  }
  coef <-  diag(DD)
  list(coef = coef, p= p)
}
xi <-  seq(1971,2011,10)
fi  <-  c(33.956,37.743,39.434,40.847,46.816 )
newton(xi,fi)