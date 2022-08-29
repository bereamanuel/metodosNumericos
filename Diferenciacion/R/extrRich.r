extrRich <- function(xi, f, h, O){
#Implementación del derivada por extrapolación de Richardson. 
#xi es el vector de puntos, deben estar equiespaciados.
#f es la función a derivar.
#h es el paso que queremos aplicar.
#orden es el orden de error que queremos cometer.

if (O == 1){
    return(df = (1/h)*(f(xi+h)-f(xi)))
    }  else if (O == 2){
    return(df = (1/h)*(-f(xi+h)+4*f(xi+(h/2))-3*f(xi)))
    } else if (O == 3){
    return(df = (1/h)*(f(xi+h)-12*f(xi+(h/2))+32*f(xi+(4/h))-21*f(xi)))
    } else {
        print("No se ha programado para mayor que orden 3")
    }

}

extrRich(c(0,0.25,0.5,0.75,1), function(x) x**2*exp(-x), h=0.25, O = 1)
