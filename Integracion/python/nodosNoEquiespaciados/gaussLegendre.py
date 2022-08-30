from math import exp

def gaussLegendre(f, a, b, n):
    ## Método de cuadratura de Gauss-Legendre
    # INPUT
    # f: función a integrar
    # a: Inicio del intervalo de integración
    # b: Fin del intervalo de integración
    # n: Número de nodos que queremos utilizar para la estimación.
    from legendre import rootsLegendre, coefLegendre
    xi = rootsLegendre(n)
    ci = coefLegendre(n)
    if (a,b) == (-1,1):
        I = sum( [ c*f(x) for x,c in zip(xi,ci) ] )
        return(I)
    else:
        I = ((b-a)/2)*sum( [ c*f(((b-a)/2)*x + ((b+a)/2)) for x,c in zip(xi,ci) ] )
        return(I)

print(gaussLegendre(lambda x : exp(-(x**2)) , 1, 1.5, n=3))