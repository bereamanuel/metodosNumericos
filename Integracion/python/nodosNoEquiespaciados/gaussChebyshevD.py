from math import exp

def gaussChebyshevD(f, a, b, c, d, n, m):
    ## Método de cuadratura de Gauss-Chebyshev doble
    # Debemos tener en cuenta que la función peso es w(x) = 1/sqrt(1-x**2)
    # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [-1,1]
    # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
    # INPUT
    # f(x,y): función a integrar 
    # a: Inicio del intervalo en x
    # b: Fin del intervalo en x
    # n: Número de subintervalos en x
    # c: Inicio del intervalo en y
    # d: Fin del intervalo en y
    # m: Número de subintervalos en y

    from chebyshev import rootsChebyshev, coefChebyshev

    xi = rootsChebyshev(n)
    yi = rootsChebyshev(m)

    cn = coefChebyshev(n)
    cm = coefChebyshev(m)

    if ((a,b) == (-1,1)) & ((c,d) == (-1,1)):
        I = sum( [ c2*c1*f(x,y) for y,c2 in zip(yi,cm)  for x,c1 in zip(xi,cn) ] )
        return(I)
    else:
        print("El intervalo no está bien definido")

f = lambda x,y : exp(x+y)
a = -1
b = 1
c = -1
d = 1
n = 5
m = 5

print(gaussChebyshevD(f, a, b, c, d, n, m))

