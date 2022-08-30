from math import exp

def gaussChebyshev(f, a, b, n):
    ## Método de cuadratura de Gauss-Chebyshev
    # Debemos tener en cuenta que la función peso es w(x) = 1/sqrt(1-x**2)
    # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [-1,1]
    # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
    # INPUT
    # f: función a integrar
    # a: Inicio del intervalo de integración
    # b: Fin del intervalo de integración
    # n: Número de nodos que queremos utilizar para la estimación.
    from chebyshev import rootsChebyshev, coefChebyshev
    xi = rootsChebyshev(n)
    ci = coefChebyshev(n)
    if (a,b) == (-1,1):
        I = sum( [ c*f(x) for x,c in zip(xi,ci) ] )
        return(I)
    else:
        print("El intervalo no está bien definido")

print(gaussChebyshev(lambda x : exp(x) , -1, 1, n=5))

def gaussChebyshevError(f, a, b, er):
    ## Método de cuadratura de Gauss-Chebyshev
    # Debemos tener en cuenta que la función peso es w(x) = 1/sqrt(1-x**2)
    # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [-1,1]
    # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
    # En esta variación, vamos a buscar n para que el error sea menor que e.
    # INPUT
    # f: función a integrar
    # a: Inicio del intervalo de integración
    # b: Fin del intervalo de integración
    # e: Cota de error.
    from chebyshev import rootsChebyshev, coefChebyshev
    from math import pi, factorial, e
    from decimal import Decimal
    n = 1
    ei = abs( (2*pi)/(2**(2*n)*factorial(2*n))*e )
    if (a,b) == (-1,1):
        while (abs(er) < ei ):
            n = n + 1
            ei = abs( (Decimal(2*pi)/Decimal(2**(2*n)*factorial(2*n)))*Decimal(e) )
        xi = rootsChebyshev(n)
        ci = coefChebyshev(n)
        I = sum( [ c*f(x) for x,c in zip(xi,ci) ] )
        return({"n":n , "I" : I, "e": er})
    else:
        print("El intervalo no está bien definido")


print(gaussChebyshevError(lambda x : exp(x) , -1, 1, 10**(-6)))
