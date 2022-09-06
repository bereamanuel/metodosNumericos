def ab2am2(f,a,b,y0,n):
    """
    Vamos a definir el método predictor-corrector de dos pasos. Utilizaremos:
    AB2: Credictor
    AM2: Corrector
    Se trata de un método mixto.
    Input:
        - f: EDO que queremos resolver
        - a: Inicio del intervalo
        - b: Fin del intervalo
        - y0: Condición inicial
        - n: Número de intervalos que utilizaremos.
    Output:
        - y: Solución
    """
    import numpy as np

    h = (b-a)/n
    t = np.insert(np.arange(a, b, h),n,b)

    #Inicializamos la solución con la CI y utilizamos Heun, para encontrar y1

    y = [y0]
    yp = [y0]

    k1 = h*f(t[0],y[0])
    k2 = h*f(t[1], y[0] + k1)
    y1 = y[0] + k1/2 + k2/2
    y.append(y1)
    yp.append(y1)

    for k in range(2,n+1):
        yp.append(y[k-1]+ (3*h*f(t[k-1],y[k-1]))/2 - (h*f(t[k-2],y[k-2]))/2)
        y.append(y[k-1] + h/2*(f(t[k],yp[k-1]) + f(t[k-1],y[k-1])))
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

print(ab2am2(f,a,b,y0,n))


