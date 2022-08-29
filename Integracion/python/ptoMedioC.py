def simpsonC(f,a,b,n):
    
    # Fórmula de Simpson Compuesto
    # INPUTS:
    # f: función a integrar
    # a: Inicio del intervalo
    # b: Fin del intervalo
    # n: Número de subintervalos, debe ser par
    import numpy as np 

    h=(b-a)/(n+2)
    x = np.arange(a+h, b, h)

    I=2*h*sum(np.vectorize(f)(x[range(0,len(x),2)]))
    return(I)

from math import *

print(simpsonC(lambda x: sin(x)*exp(-x) ,0, pi/2, 8))
