from hermite import coefHermite

def gaussHermite(f,n,m,kn,km):
    ## Método de cuadratura de Gauss-Hermite
    # Debemos tener en cuenta que la función peso es w(x) = exp(-x**2)
    # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [-inf,inf]
    # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
    # INPUT
    # f: función a integrar
    # n: Número de nodos que queremos utilizar para la estimación.
    # k: Constante que aparece si hacemos cambios de variable
    coefsN = coefHermite(n)
    coefsM = coefHermite(m)
    I =  0
    for i in range(0,n):
        for j in range(0,m):
            I = I + coefsN["ci"][i]*coefsM["ci"][j]*f(coefsN["roots"][i], coefsM["roots"][j]) 
    return(I*kn*km)

f = lambda x,y : abs(x+y)
n = 30
m = 30
kn = 1/4
km = 1/4

print(gaussHermite(f,n,m,kn,km))