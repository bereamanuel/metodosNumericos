def simpsonC(f,a,b,n):
    # Fórmula de Simpson Compuesto
    # INPUTS:
    # f: función a integrar
    # a: Inicio del intervalo
    # b: Fin del intervalo
    # n: Número de subintervalos
    import numpy as np 
    h= (b-a)/n
    x= np.insert(np.arange(a, b, h),n,b)
    fi = [f(x[0])]
    for i in range(1,n):
        if i%2==0:
            fi.append(2*f(x[i]))
        else:
            fi.append(4*f(x[i]))
    fi.append(f(x[n]))
    return( (h/3)*sum(fi)  )

from math import *

print(simpsonC(lambda x: sin(x)*exp(-x) ,0, pi/2, 30))
