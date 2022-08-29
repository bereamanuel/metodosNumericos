def trapeciosC(f,a,b,n):
    # Fórmula de Trapecios Compuesto
    # INPUTS:
    # f: función a integrar
    # a: Inicio del intervalo
    # b: Fin del intervalo
    # n: Número de subintervalos
    import numpy as np 

    h= (b-a)/n
    x= np.insert(np.arange(a, b, h),n,b)

    pesos= np.insert(np.insert(np.repeat(2, n-1), 0,1),n,1)

    return(h/2*sum(pesos*np.vectorize(f)(x)) )

from math import *

print(trapeciosC(lambda x: sin(x)*exp(-x) ,0, pi/2, 8))
