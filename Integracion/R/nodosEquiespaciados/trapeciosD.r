trapeciosD <- function(f,a,b,c,d,n,m){
    # Fórmula de Trapecios para integral doble
    # INPUTS:
    # f(x,y): función a integrar 
    # a: Inicio del intervalo en x
    # b: Fin del intervalo en x
    # n: Número de subintervalos en x
    # c: Inicio del intervalo en y
    # d: Fin del intervalo en y
    # m: Número de subintervalos en y

    h <- (b-a)/n
    k <- (d-c)/m

    x <- seq(a,b,h)
    y <- seq(c,d,k)

    I = 0 

    for (i in seq(1,n)){
        for (j in seq(1,m)){
            I <- I + f(x[i],y[j]) + f(x[i],y[j+1]) + f(x[i+1],y[j]) + f(x[i+1],y[j+1])
        }
    }
    return((h*k)/4 * I )
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

print(trapeciosD(f,a,b,c,d,n,m))