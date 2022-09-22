def eulerS(f,a,b,y0,n):
    """
    Con esta función vamos a implementar el método de Euler explicito para sistemas
    INPUT:
        f:  Función de entrada
        a:  Inicio del intervalo
        b:  Fin del intervalo
        y0: Condición inicial
        n:  Número de subintervalos
    
    OUTPUT:
        t: Vector de puntos desde a hasta b con paso h 
        y: Vector solucion en cada instante t
    """
    import numpy as np

    h = (b-a)/n
    t = np.insert(np.arange(a, b, h),n,b)

    y = [y0]

    for k in range(1,n+1):
        y.append(y[k-1] + h*f(t[k-1],y[k-1]))
    return(t, y)

import numpy as np

def f(t,Y):
    import numpy as np
    from math import exp
    F = np.array( [[3 , 2] , [4, 1]] )
    return( np.dot(F,Y) + np.array([[-(2*t**2 + 1)*exp(2*t)], [(t**2 + 2*t + -4)*exp(2*t)]]) )



a = 0
b = 1
y0 = np.array([[1],[1]]) 
N = [2,4,8,16,32,64]


print(eulerS(f,a,b,y0,10))


