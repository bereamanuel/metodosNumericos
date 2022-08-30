laguerre <- function(x, n){
    # Función que nos devuelve el valor del polinomio de Laguerre de grado n en un punto x
    if (n == 0) {
        return(1)
    }else if (n == 1) {
        return(1-x)
    }else{
        return( (2*(n-2)+3 -x)*laguerre(x, n-1) - (((n-1)**2)*laguerre(x, n-2)) )
    }
}

coefLaguerre <- function(n){
    # Esta función nos calcula los coeficientes del polinomio de Laguerre de grado n, además las raices de dicho polinomio.
    # Por último, nos devuelve los ci que utilizamos para poder aplicar el método de cuadratura de Gauss-Laguerre.
    ai <- c()
    for (k in seq(0,n)){
        ai <- c(ai, ((-1)**k)*((factorial(n)*(factorial(n)))/( factorial(n-k)*factorial(k)*factorial(k) ) ) )
    }

    ri = polyroot(ai)
    ci <- c()
    for (r in ri){
        ci <- c(ci , ((factorial(n)**2)*r)/(laguerre(r, n+1)**2) )
    }
    return(c("ai"= ai, "roots" = ri,"ci" = ci))
}
#Necesitamos estas funciones para poder hacer la cuadratura de Gauss-Leguerre.
n = 3
print(coefLaguerre(n)
