def ab2(f,a,b,y0,n):
    """
    Vamos a definir el método de Adams-Bashforth de dos pasos
    Se trata de un método explícito. Como conocemos un punto inicial
    y necesitamos y0 e y1, y1 lo calculamos con otro método numérico,
    que normalmente, será del mismo orden. En nuestro caso, vamos a utilizar Heun.
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

    k1 = h*f(t[0],y[0])
    k2 = h*f(t[1], y[0] + k1)
    y1 = y[0] + k1/2 + k2/2
    y.append(y1)

    for k in range(2,n+1):
        y.append(y[k-1]+ (3*h*f(t[k-1],y[k-1]))/2 - (h*f(t[k-2],y[k-2]))/2)
    
    return(y)


# def ordenAB2(f,a,b,y0,n,N):
#     """
#     Vamos a definir el método de estimación de orden por error del método AB2
#     Input:
#         - f: EDO que queremos resolver
#         - a: Inicio del intervalo
#         - b: Fin del intervalo
#         - y0: Condición inicial
#         - n: Número de intervalos que utilizaremos para iniciar el método
#         - N: Número máximo de intervalos que vamos a utilizar evaluar e estimar.
#     Output:
#         - y: Solución
#     """
#     ns = [k*2*n for k in range(2,N)]
#     e = [ab2(f,a,b,y0,n)]
#     for i in range(1, len(ns)+1):
#         e.append(np.linalg.norm(np.array(e[i-1])-np.array(ab2(f,a,b,y0,ns[i]))))
#     return(e)




import numpy as np

def f(t,Y):
    import numpy as np
    F = np.array( [[0 , 1] , [(9.81/0.5), 0]] )
    return( np.dot(F,Y) )

a = 0
b = 2
n = 10
y0 = np.array([[0],[0.25]]) 

print(ab2(f,a,b,y0,n))


# print(ordenAB2(f,a,b,y0,n,6))