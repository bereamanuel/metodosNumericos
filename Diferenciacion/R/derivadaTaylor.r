derivadaTaylor  <- function(xi, f, orden){

    n  <-  length(xi)

    #Gerenamos los valores de los nodos en la función
    fi  <-  sapply(xi, f)

    print(fi)
    print(f)
    #Los nodos deben ser equiespaciados
    h  <-  xi[2]-xi[1]
    print(h)
    if (orden == 1){
        #Generamos la derivada progresivas de orden 1, con 1 y 2 pasos.
        dph  <-  (1/h)*(fi[2:n] - fi[1:(n-1)])
        dph2  <-  (1/2/h)*(-fi[3:n] + 4*fi[2:(n-1)] - 3*fi[1:(n-2)])

        #Generamos las diferencias regresivas
        drh  <-  (1/h)*(-fi[1:(n-1)] + fi[2:n])
        drh2  <-  (1/2/h)*(fi[1:(n-2)] - 4*fi[2:(n-1)] + 3*fi[3:n])

        #Generamos las diferencias centrales
        dch2  <-  (1/2/h)*(fi[3:n]-fi[1:(n-2)])
        dch4  <-  (1/12/h)*(-fi[5:n]+8*fi[4:(n-1)]-8*fi[2:(n-3)] + fi[1:(n-4)])

        return(c("Prog Oh" = dph, 
                "Prog Oh2" = dph2,  
                "Rege Oh" = drh, 
                "Rege Oh2" = drh2,
                "Cent Oh2" = dch2, 
                "Cent Oh4" = dch4))
    }else if (orden == 2){
        #Generamos la derivada progresivas de orden 1, con 1 y 2 pasos.
        dph = (1/(h**2))*(fi[3:n] - 2*fi[2:(n-1)] + fi[1:(n-2)])
        dph2 = (1/(h**2))*(-fi[4:n] + 4*fi[3:(n-1)] - 5*fi[2:(n-2)] + 2*fi[1:(n-3)])

        #Generamos las diferencias regresivas
        drh = (1/(h**2))*(fi[1:(n-2)] - 2*fi[2:(n-1)] + fi[3:n])
        drh2 = (1/(h**2))*(2*fi[1:(n-3)] - 5*fi[2:(n-2)] + 4*fi[3:(n-1)] - fi[4:n])

        #Generamos las diferencias centrales
        dch2 = (1/(h**2))*(fi[3:n] - 2*fi[2:(n-1)] + fi[1:(n-2)])
        dch4 = (1/12/(h**2))*(-fi[5:n] + 16*fi[4:(n-1)] - 30*fi[3:(n-2)] + 16*fi[2:(n-3)] - fi[1:(n-4)])
        
        return(c("Prog Oh" = dph, 
                "Prog Oh2" = dph2,  
                "Rege Oh" = drh, 
                "Rege Oh2" = drh2,
                "Cent Oh2" = dch2, 
                "Cent Oh4" = dch4))
    } else if (orden == 3) {
        #Generamos la derivada progresivas de orden 1, con 1 y 2 pasos.
        dph = (1/(h**3))*(fi[4:n] - 3*fi[3:(n-1)] + 3*fi[2:(n-2)] - fi[1:(n-3)])
        dph2 = (1/2/(h**3))*(-3*fi[5:n] + 14*fi[4:(n-1)] - 24*fi[3:(n-2)] + 18*fi[2:(n-3)] - 5*fi[1:(n-4)])

        #Generamos las diferencias regresivas
        drh = (1/(h**3))*(fi[1:(n-3)] - 3*fi[2:(n-2)] + 3*fi[3:(n-1)] - fi[4:n])
        drh2 = (1/2/(h**3))*(5*fi[1:(n-4)] - 18*fi[2:(n-3)] + 24*fi[3:(n-2)] - 14*fi[4:(n-1)] + 3*fi[5:n])

        #Generamos las diferencias centrales
        dch2 = (1/2/(h**3))*(fi[5:n] - 3*fi[4:(n-1)] + 3*fi[2:(n-3)] - fi[1:(n-4)])
        dch4 = (1/8/(h**3))*( -fi[7:n] + 8*fi[6:(n-1)] -13*fi[5:(n-2)] + 13*fi[3:(n-4)] -8*fi[2:(n-5)] + fi[1:(n-6)])

        return(c("Prog Oh" = dph, 
                "Prog Oh2" = dph2,  
                "Rege Oh" = drh, 
                "Rege Oh2" = drh2,
                "Cent Oh2" = dch2, 
                "Cent Oh4" = dch4))
    }else{
        return("No se ha programado para mayor que orden 3")

    }
}
print(derivadaTaylor(c(0,0.25,0.5,0.75,1), function(x) x**2*exp(-x), orden = 1))