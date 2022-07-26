<<<<<<< HEAD
def eulerI(f,a,b,y0,N,tol,maxiter):
=======
def eulerI(f,df,a,b,y0,n,tol,maxiter):
>>>>>>> 879e9cff644fbcd51810a921f97b86a3e73f8d22
    """
    Con esta función vamos a implementar el método de Euler implicito
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

    h = (b-a)/N
    t = np.insert(np.arange(a, b, h),N,b)

    y = [y0]
    for k in range(0,N):
        x0 = y[k]
        i = 1 
        dif = tol+1
        while i < maxiter and dif>tol:
            fx0 = f(t[k+1],x0,"f")
            df0 = f(t[k+1],x0,"df")
            g = x0 - y[k] - h*fx0
            dg = 1-h*dfx0
            x1 = x0 - g/dg
            dif = abs(x1-x0[0])
            i = i + 1
            x0 = x1

        y.append(y[k] + h *f(t[k+1],x0,"f") )

<<<<<<< HEAD
    return(t, y)

def f(x,y,t):
    if t == "f":
        return((1-2*x)*y)
    else:
        return((1-2*x))
=======
    for k in range(0,n):
        x0 = y[k]
        i = 1
        dif = tol+1
        while i < maxiter and dif > tol:
            fx0 = f(t[k+1],x0)
            dfx0 = df(t[k+1],x0)
            g = x0-y[k]-h*fx0
            dg = 1-h*dfx0
            x1 = x0 - g/dg
            dif = abs(x1-x0)
            i = i + 1
            x0 = x1
        y.append(y[k]+h*f(t[k+1],x0))

    return(t, y)


def f(t,y):
    return( -10*y )

def df(t,y):
    return( -10 )
>>>>>>> 879e9cff644fbcd51810a921f97b86a3e73f8d22

a = 0
b = 3
y0 = [1]
N = [2,4,8,16,32,64]
tol = 10**(-6)
iter = 50

<<<<<<< HEAD
print(eulerI(f,a,b,y0,4, tol = 10**(-6), maxiter= 50))
=======
print(eulerI(f,df,a,b,y0,4,tol,iter))
>>>>>>> 879e9cff644fbcd51810a921f97b86a3e73f8d22

import matplotlib.pyplot as plt
for n in N:
    plt.plot(eulerI(f,df,a,b,y0,n,tol,iter)[0],eulerI(f,df,a,b,y0,n,tol,iter)[1] )
plt.legend(["N=2","N=4","N=8","N=16","N=32","N=64"])
plt.show()
