def ab4am4(f,a,b,y0,n):
    """
    Vamos a definir el método predictor-corrector de 4 pasos. Utilizaremos:
    AB4: Credictor
    AM4: Corrector
    Se trata de un método mixto.
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
    yp = [y0]

    for k in range(1,4):
        k1 = f(t[k-1],y[k-1])
        k2 = f(t[k-1] + h/2, y[k-1] + (h*k1)/2)
        k3 = f(t[k-1] + h/2, y[k-1] + (h*k2)/2)
        k4 = f(t[k],y[k-1] + h*k3)
        y.append(y[k-1] + h/6 *(k1 + 2*k2 + 2*k3 + k4 ) )
        yp.append(y[k-1] + h/6 *(k1 + 2*k2 + 2*k3 + k4 ) )
    

    for k in range(4,n+1):
        yp.append(y[k-1]+ h/24*(55*f(t[k-1],y[k-1]) -59*f(t[k-2],y[k-2]) + 37*f(t[k-3],y[k-3]) -9*f(t[k-4],y[k-4])))
        y.append(y[k-1] + h/24*(f(t[k-3],y[k-3]) -5*f(t[k-2],y[k-2]) +19*f(t[k-1],y[k-1]) + 9*f(t[k],yp[k-1])) )
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

print(ab4am4(f,a,b,y0,n))


