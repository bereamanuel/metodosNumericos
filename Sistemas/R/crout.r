Crout <- function(dP ,dS ,dI ,b){
  #dP diag of matrix to solve
  #dS diag sup mtrix to solve
  #dI diag Inf matrix to solve
  #b vector independent
    
  n <- length (dP)
  
  l <- matrix(0,n,n)
  u <- matrix(0,n,n)
  z <- vector(length = n)
  # 1. Obtención de las matrices L y U tales que A = LU
  l[1,1]<-dP[1]
  u[1,2]<-dS[1]/l[1,1]
  
  for (i in seq(2,n - 1) ){
    l[i,i-1] <- dP[i-1]
    l[i,i] <- dP[i]-l[i,i-1]*u[i -1,i]
    u[i,i+1] <- dP[i+1]/l[i,i]
  }
  
  l[n,n-1] <- dP[n-1]
  l[n,n] <- dP[n]-l[n,n-1]*u[n -1,n]
  
  # 2. Solución del sistema Lz = b
  
  z <- solve(l)%*%b
  
  # 3. Solución del sistema Ux = z
  x <- solve(u)%*%z
  
  return(x)
}
