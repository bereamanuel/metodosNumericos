gaussLegendre <- function(f, a, b, n){
    ## Método de cuadratura de Gauss-Legendre
    # INPUT
    # f: función a integrar
    # a: Inicio del intervalo de integración
    # b: Fin del intervalo de integración
    # n: Número de nodos que queremos utilizar para la estimación.
    source("Polinomios\\R\\legendre.r")
    xi <- rootsLegendre(n)
    ci <- coefLegendre(n)
    k <- length(xi)
    if (sum(c(a,b) == c(-1,1)) == 2 ){
        I <- 0
        for (i in seq(1,k)){
        I <- I + ci[i]*f(xi[i])
        }
        return(I)
    }else{
        I <- 0
        for (i in seq(1,k)){
        I <- I + ci[i]*f(((b-a)/2)*xi[i] + ((b+a)/2))
        }
        return(((b-a)/2)*I)
    }
}

f <- function(x) exp(-(x**2))
a <- 1
b <- 1.5
n <- 3

gaussLegendre(f , a, b, n)