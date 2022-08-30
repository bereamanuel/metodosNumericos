def hermite(x, n):
    """
    Función que nos devuelve el valor del polinomio de Hermite de grado n en un punto x
    """
    import sympy as sym
    if n == 0 :
        return(1)
    elif n == 1 :
        return(2*x)
    else:
        return( 2*x*hermite(x,n-1) - 2*(n-1)*hermite(x,n-2) )




def coefHermite(n):
    """
    Esta función nos calcula los coeficientes del polinomio de Hermite de grado n, además las raices de dicho polinomio.
    Por último, nos devuelve los ci que utilizamos para poder aplicar el método de cuadratura de Gauss-Laguerre.
    """
    from math import factorial, sqrt, pi
    from sympy.polys.orthopolys import hermite_poly

    p = hermite_poly(n, polys= True)
    p1 = hermite_poly(n-1, polys= True)
    ai = p.coeffs()
    ri = p.nroots()
    ci = [ ((2**(n-1))*factorial(n)*sqrt(pi))/((n**2)*(p1.eval(r))**2) for r in ri ]
    return({"ai": ai, "roots": list(ri),"ci" : ci})

#Necesitamos estas funciones para poder hacer la cuadratura de Gauss-Leguerre.
n = 4

print(coefHermite(n))
