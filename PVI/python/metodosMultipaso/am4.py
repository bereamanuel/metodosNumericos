def am4(f,a,b,y0,n):
    """
    Vamos a definir el método de Adams-Moulton de 4 pasos 
    Se trata de un método implícito. 
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

    #Inicializamos la solución con la CI y utilizamos Runge-Kutta, para encontrar y1 e y2
    y = [y0]

    for k in range(1,4):
        k1 = f(t[k-1],y[k-1])[0]
        k2 = f(t[k-1] + h/2, y[k-1] + (h*k1)/2)[0]
        k3 = f(t[k-1] + h/2, y[k-1] + (h*k2)/2)[0]
        k4 = f(t[k],y[k-1] + h*k3)[0]
        y.append(y[k-1] + h/6 *(k1 + 2*k2 + 2*k3 + k4 ) )

    maxiter = 10
    tol = 10**(-6)
    for k in range(4, n+1):
        i = 1
        dif = 1 
        x0 = y[k-1]
        while i < maxiter and dif > tol:
            [fx0, dfx0] = f(t[k], x0)
            g = x0 - y[k-1] - h/24*(f(t[k-3],y[k-3])[0] -5*f(t[k-2],y[k-2])[0]+ 19*f(t[k-1],y[k-1])[0] +9*fx0)
            dg = 1-h/24*9*dfx0
            x1 = x0-g/dg
            dif=abs(x1-x0)
            i +=1
            x0=x1
        y.append( y[k-1] + h/24*(f(t[k-3],y[k-3])[0] -5*f(t[k-2],y[k-2])[0]+ 19*f(t[k-1],y[k-1])[0] +9*f(t[k],x0)[0])  )
    
    return([y])

def f(t,y):
    fx = (1-2*t)*y
    dfx = 1-2*t
    return([fx,dfx])

a = 0
b = 3
y0 = 1
n = 16

print(am4(f,a,b,y0,n))