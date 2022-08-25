splinesCubicos  <- function(xi,fi){
    #Implementación de los splines cúbicos.
    #Obtenemos los coeficientes.
    n  <- length(xi)
    #Definimos h_i =  x_{i+1} - x_i
    hi  <- diff(xi)
    #Definimos a_i = fi
    ai  <- fi
    #Definimos las diagonales de A, es decir dP, dI, dS para nuestro algoritmo de crout
    ## Diagonal Superior
    dS  <- c(0,hi)
    ## Diagonal Pincipal
    if (n>3){
    h0  <- hi[1:(n-2)]
    h1  <- hi[2:(n-1)]
    auxdP <- 2*(h0+h1)
    dP  <- c(1,auxdP,1)
    rm(h0)
    rm(h1)
    rm(auxdP)
    } else {
        dP  <- c(1,2*(hi[1]+hi[2]),1)
    }
    ## Diagonal Inferior
    dI  <- c(hi[1:(n-2)],0)

    #Calculamos b
    a0  <- diff(ai[1:(n-1)])/hi[1:(n-2)]
    a1  <- diff(ai[2:n])/hi[2:(n-1)]
    b  <- 3*c(0,(a1-a0),0)

    #Calculamos ci por crout
    ci  <- Crout(dP,dS,dI,b)

    #Calculamos b_i
    bi  <- ((1/hi)*(ai[2:n]-ai[1:(n-1)]))-((hi/3)*(2*ci[1:(n-1)]+ci[2:n]))

    #Calculamos d_i
    di  <- (diff(ci)/(3*hi))

    return(c(ai,bi,ci,di))
    
}

xi <-  seq(1971,2011,10)
fi  <-  c(33.956,37.743,39.434,40.847,46.816 )
splinesCubicos(xi, fi)
