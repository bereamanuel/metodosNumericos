def hermite(xi,fi,dfi):
    """
    Función para calcular el polinomio de interpolación de Hermite
    Para poder ejecutarla, necesitamos los puntos y los valores de la función y los que toma en la derivada.
    
    Como output, vamos a obtener el polinomio y sus coeficientes. 
    """
    import numpy as np
    import pandas as pd
    import sympy as sym

    def flatten(l):
        return [item for sublist in l for item in sublist]

    
    x = sym.Symbol('x')

    col = 1
    p = fi[0]
    vx = 1 

    z = flatten([[x,x] for x in xi])
    F = flatten([[f,f] for f in fi])
    n = len(z)

    dd = pd.DataFrame(np.zeros((n,n)))
    dd.iloc[:,0] = F

    for j in range(1,n):
        if j % 2 != 1:
            dd.iloc[j,1] = (dd.iloc[j,0] - dd.iloc[j-1,0] )/(z[j] - z[j-1]) 
        else:
            dd.iloc[j,1] = dfi[j//2]

    for i in range(2,n):
        for j in range(i,n):
            dd.iloc[j,i] = (dd.iloc[j,i-1] - dd.iloc[j-1,i-1] )/(z[j] - z[j-i])

    print(dd)
    while col <= n -1 :
        vx = vx*(x-z[col-1])
        p = p + dd.iloc[col,col]*vx
        col += 1
    p = sym.Poly(p, x)


    return [round(x, 4) for x in p.coeffs()], p

xi = [0,0.5,1]
fi = [1,0.9385,0.7652]
dfi = [0,-0.2423,-0.4401]

coef , p = hermite(xi,fi,dfi)

print(coef)
print(p)