gaussLegendreD <- function(f, a, b, c, d, n, m){
    ## Método de cuadratura de Gauss-Legendre
    # INPUT
    # f(x,y): función a integrar 
    # a: Inicio del intervalo en x
    # b: Fin del intervalo en x
    # n: Número de subintervalos en x
    # c: Inicio del intervalo en y
    # d: Fin del intervalo en y
    # m: Número de subintervalos en y

    xn <- rootsLegendre(n)
    cn <- coefLegendre(n)
    kn <- length(xn)

    ym <- rootsLegendre(m)
    cm <- coefLegendre(m)
    km <- length(ym)

    if (sum(c(a,b) == c(-1,1)) == 2 ){
        I <- 0
        for (i in seq(1,kn)){
            for (j in seq(1,km)){
                I <- I + cm[j]*cn[i]*f(xn[i], ym[j])
            }
        }
        return(I)
    }else{
        I <- 0
        for (i in seq(1,kn)){
            for (j in seq(1,km)){
                I <- I + cm[j]*cn[i]*f(((b-a)/2)*xn[i] + ((b+a)/2) , ((d-c)/2)*ym[j] + ((d+c)/2) )
            }
        }
        return(I*((b-a)/2)*((d-c)/2))
    }
}

f <- function(x,y){
    return( sqrt( (x**2 + y**2)/(9 - x**2 - y**2) ) )
}
a <- 0
b <- 1
c <- 0
d <- 1
n <- 10
m <- 10

print(gaussLegendreD(f, a, b, c, d, n, m))


