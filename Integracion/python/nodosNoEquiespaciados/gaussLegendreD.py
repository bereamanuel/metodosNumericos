def gaussLegendreD(f, a, b, c, d, n, m):
    ## Método de cuadratura de Gauss-Legendre
    # INPUT
    # f(x,y): función a integrar 
    # a: Inicio del intervalo en x
    # b: Fin del intervalo en x
    # n: Número de subintervalos en x
    # c: Inicio del intervalo en y
    # d: Fin del intervalo en y
    # m: Número de subintervalos en y
    from legendre import rootsLegendre, coefLegendre
    xn = rootsLegendre(n)
    cn = coefLegendre(n)

    ym = rootsLegendre(m)
    cm = coefLegendre(m)

    if (a,b) == (-1,1):
        I = sum( [ c2*c1*f(x,y) for y,c2 in zip(ym,cm)  for x,c1 in zip(xn,cn) ] )
        return(I)
    else:
        I = ((b-a)/2)*((d-c)/2)*sum( [ c2*c1*f(((b-a)/2)*x + ((b+a)/2) , ((d-c)/2)*y + ((d+c)/2) ) for y,c2 in zip(ym,cm)  for x,c1 in zip(xn,cn) ] )
        return(I)


def f(x,y):
    from math import sqrt
    return( sqrt( (x**2 + y**2)/(9-x**2-y**2) ) )

a = 0
b = 1
c = 0
d = 1
n = 4
m = 4

print(gaussLegendreD(f, a, b, c, d, n, m))


