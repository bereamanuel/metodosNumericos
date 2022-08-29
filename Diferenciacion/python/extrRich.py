import math

def extrRich(xi, f, h, O):
    #Implementación del derivada por extrapolación de Richardson. 
    #xi es el vector de puntos, deben estar equiespaciados.
    #f es la función a derivar.
    #h es el paso que queremos aplicar.
    #orden es el orden de error que queremos cometer.
    import math

    if (O == 1):
        return([(1/h)*(f(x+h)-f(x)) for x in xi ]) 
    elif (O == 2):
        return([(1/h)*(-f(x+h)+4*f(x+(h/2))-3*f(x)) for x in xi ])
    elif (O == 3):
        return([(1/h)*(f(x+h)-12*f(x+(h/2))+32*f(x+(4/h))-21*f(x)) for x in xi] )
    else:
        print("No se ha programado para mayor que orden 3")

print(extrRich([0,0.25,0.5,0.75,1], lambda x : x**2*math.exp(-x), h=0.25, O = 1))