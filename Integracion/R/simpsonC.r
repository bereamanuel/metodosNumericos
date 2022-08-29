simpsonC <- function(f,a,b,n){
  # Fórmula de Simpson Compuesto
  # INPUTS:
  # f: función a integrar
  # a: Inicio del intervalo
  # b: Fin del intervalo
  # n: Número de subintervalos
  
  h <- (b-a)/n
  x <- seq(a,b,h)
  fi <- c(f(a))
  for (i in seq(2,n) ) {
    if (i%%2!=0){
      fi <- c(fi, 2*f(x[i]))
    }else{
      fi <- c(fi, 4*f(x[i]))
    }
  }
  fi <- c(fi, f(b))
  print(fi)
  return( (h/3)*sum(fi)  )
}
print(simpsonC(function(x) x+3 ,-1, 4, 30))