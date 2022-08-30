from hermite import coefHermite

def gaussHermite(f,n ,k):
    ## Método de cuadratura de Gauss-Hermite
    # Debemos tener en cuenta que la función peso es w(x) = exp(-x**2)
    # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [-inf,inf]
    # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
    # INPUT
    # f: función a integrar
    # n: Número de nodos que queremos utilizar para la estimación.
    # k: Constante que aparece si hacemos cambios de variable
    coefs = coefHermite(n)
    I =  0
    for i in range(0,n) :
        I = I + coefs["ci"][i]*f(coefs["roots"][i]) 
    return(I*k)

f = lambda x : abs(x)
n = 4
k = 1/4

print(gaussHermite(f, n , k))