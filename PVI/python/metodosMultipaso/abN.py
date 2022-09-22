def abN(f,a,b,y0,n,N):
    """
    Vamos a definir el método de Adams-Bashforth de N pasos (N=3 o N=4)
    Se trata de un método explícito. Como conocemos un punto inicial
    y necesitamos y0 e y1, y2,...
    que normalmente, será del mismo orden. En nuestro caso, vamos a utilizar Runge-Kutta.
    Input:
        - f: EDO que queremos resolver
        - a: Inicio del intervalo
        - b: Fin del intervalo
        - y0: Condición inicial
        - n: Número de intervalos que utilizaremos.
        - N: Número de pasos
    Output:
        - y: Solución
    """
    import numpy as np

    h = (b-a)/n
    t = np.insert(np.arange(a, b, h),n,b)

    #Inicializamos la solución con la CI y utilizamos Runge-Kutta, para encontrar y1 e y2
    y = [y0]

    for k in range(1,N):
        k1 = f(t[k-1],y[k-1])
        k2 = f(t[k-1] + h/2, y[k-1] + (h*k1)/2)
        k3 = f(t[k-1] + h/2, y[k-1] + (h*k2)/2)
        k4 = f(t[k],y[k-1] + h*k3)
        y.append(y[k-1] + h/6 *(k1 + 2*k2 + 2*k3 + k4 ) )
    
    if N == 3:
        for k in range(N,n+1):
            y.append(y[k-1]+ h/12*(23*f(t[k-1],y[k-1]) -16*f(t[k-2],y[k-2]) +5*f(t[k-3],y[k-3])))
    elif N == 4:
        for k in range(N,n+1):
            y.append(y[k-1]+ h/24*(55*f(t[k-1],y[k-1]) -59*f(t[k-2],y[k-2]) + 37*f(t[k-3],y[k-3]) -9*f(t[k-4],y[k-4])))
    else:
        return(print("No se ha implementado el método para N mayor que 4"))
    return(y)

import numpy as np

def f(t,Y):
    import numpy as np
    F = np.array( [[0 , 1] , [(9.81/0.5), 0]] )
    return( np.dot(F,Y) )

a = 0
b = 2
n = 10
y0 = np.array([[0],[0.25]]) 

print(abN(f,a,b,y0,n,4))


