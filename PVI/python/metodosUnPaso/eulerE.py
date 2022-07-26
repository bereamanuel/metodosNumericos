def eulerE(f,a,b,y0,n):
    """
    Con esta función vamos a implementar el método de Euler explícito
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

# def f(t,y):
#     return( (1-2*t)*y )

# a = 0
# b = 3
# y0 = 1
# N = [2,4,8,16,32,64]

# import matplotlib.pyplot as plt
# for n in N:
#     plt.plot(euler(f,a,b,y0,n)[0],euler(f,a,b,y0,n)[1] )
# plt.legend(["N=2","N=4","N=8","N=16","N=32","N=64"])
# plt.show()
