def laguerre(x, n):
    """
    Función que nos devuelve el valor del polinomio de Laguerre de grado n en un punto x
    """
    if n == 0 :
        return(1)
    elif n == 1 :
        return(1-x)
    else:
        return( (2*(n-2)+3 -x)*laguerre(x, n-1) - (((n-1)**2)*laguerre(x, n-2)) )


def coefLaguerre(n):
    """
    Esta función nos calcula los coeficientes del polinomio de Laguerre de grado n, además las raices de dicho polinomio.
    Por último, nos devuelve los ci que utilizamos para poder aplicar el método de cuadratura de Gauss-Laguerre.
    """
    from math import factorial
    from decimal import Decimal as d 
    import numpy as np

    ai = [ ((-1)**k)*((factorial(n)*(factorial(n)))/( factorial(n-k)*factorial(k)*factorial(k) ) ) for k in range(0,n+1)]
    ai.reverse()
    ri = np.roots(ai)
    ci = [ ((factorial(n)**2)*r)/(laguerre(r, n+1)**2) for r in ri ]
    return({"ai": ai, "roots": list(ri),"ci" : ci})

#Necesitamos estas funciones para poder hacer la cuadratura de Gauss-Leguerre.
n = 3
print(coefLaguerre(n))
