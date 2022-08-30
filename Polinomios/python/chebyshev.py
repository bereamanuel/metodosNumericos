import math
def chebyshev(x, n):
    """
    Función que nos devuelve el valor del polinomio de Chebyshev de grado n en un punto x
    """
    if n == 0 :
        return(1)
    elif n == 1 :
        return(x)
    else:
        return( 2*x*chebyshev(x, n-1) - chebyshev(x, n-2) )
    
def rootsChebyshev(n):
    """
    Esta función nos devuelve las raices del polinomio de Chebyshev de grado n 
    """
    import math
    xi = [ math.cos((math.pi/2)*((2*k+1)/n)) for k in range(1,n+1)]
    return (xi)

def coefChebyshev(n):
    """
    Esta función nos devuelve los coeficientes del polinomio de grado n, para la cuadratura de G-C
    """
    return([math.pi/n]*n)

#Necesitamos estas funciones para poder hacer la cuadratura de Gauss-Legrendre
n = 3
print(rootsChebyshev(n), coefChebyshev(n))