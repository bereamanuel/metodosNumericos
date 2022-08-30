def legendre(x, n):
    """
    Función que nos devuelve el valor del polinomio de legrendre de grado n en un punto x
    """
    if n == 0 :
        return(1)
    elif n == 1 :
        return(x)
    else:
        return( (1/n)*((2*(n-1)+1)*x*legendre(x,n-1) - (n-1)*legendre(x,n-2)) )
    
def rootsLegendre(n):
    """
    Esta función nos devuelve las raices del polinomio de legrendre de grado n 
    """
    import math
    xi = [(1 - (1/(8*n**2)) + (1/(8*n**3)))*math.cos(math.pi *((4*k - 1)/(4*n+2))) for k in range(1,n+1)]
    return (xi)

def coefLegendre(n):
    """
    Esta función nos devuelve los coeficientes del polinomio de grado n, para la cuadratura de G-L
    """
    xi = rootsLegendre(n)
    #Utilizamos la relacción de recurrencia para calcular el valor de la derivada en x
    dxi = [ 1/(1-(x**2))*((n+1)*x*legendre(x,n) - (n+1)*legendre(x,n+1) ) for x in xi] 
    ci = [ 2/((1-xi[i]**2)*((dxi[i]))**2) for i in range(0,len(xi))]
    return(ci)