Crout <- function(dP ,dS ,dI ,b){
  #dP diag of matrix to solve
  #dS diag sup mtrix to solve
  #dI diag Inf matrix to solve
  #b vector independent
    
  n <- length (b)
  
  l <- vector(length = n)
  u <- vector(length = n)
  z <- vector(length = n)
  x <- vector(length = n)
  # 1. Obtención de las matrices L y U tales que A = LU
  l[1]<-dP[1]
  u[1]<-dS[1]/l[1]
  for (i in seq(2,n - 1) ){
    l[i] <- dP[i]-dI[(i-1)]*u[(i-1)]
    u[i] <- dS[i]/l[i]
  }

  l[n] <- dP[n]-dI[(n-1)]*u[(n-1)]
  
  z[1]  <- b[1]/l[1]

  for (i in seq(2,n)){
    z[i]  <- (1/l[i])*(b[i]-dI[(i-1)]*z[(i-1)])
  }

  x[n]  <- z[n]

  for (i in seq(n-1,1,-1)){
    x[i]  <- z[i]-u[i]*x[(i+1)]
  }
  return(x)
}

