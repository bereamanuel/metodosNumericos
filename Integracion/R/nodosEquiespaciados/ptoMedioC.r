simpsonC <- function(f,a,b,n){
  # Fórmula de Simpson Compuesto
  # INPUTS:
  # f: función a integrar
  # a: Inicio del intervalo
  # b: Fin del intervalo
  # n: Número de subintervalos, debe ser par
  
  h=(b-a)/(n+2)
  x = seq(a+h, b, h)
  
  I=2*h*sum(f(x[seq(1,length(x),2)]))
  return(I)
}


print(simpsonC(function(x) sin(x)*exp(-x) ,0, pi/2, 8))
