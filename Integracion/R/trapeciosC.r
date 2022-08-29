trapeciosC <- function(f,a,b,n){
    # Fórmula de Trapecios Compuesto
    # INPUTS:
    # f: función a integrar
    # a: Inicio del intervalo
    # b: Fin del intervalo
    # n: Número de subintervalos

    h <- (b-a)/n
    x <- seq(a,b,h)
    pesos <- c(1 ,rep(2,n-1), 1)
    return( h/2*sum(pesos*f(x)) )
}

print(trapeciosC(function(x) x+3 , -1, 4, 30))