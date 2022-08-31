from laguerre import coefLaguerre
from math import sin
def gaussLaguerreD(f,n,m,kn,km):
  ## Método de cuadratura de Gauss-Laguerre
  # Debemos tener en cuenta que la función peso es w(x) = exp(-x)
  # Por lo que lo aplicaremos a integrales del estilo w(x) * f(x) en el intervalo [0,+inf]
  # debemos tener encuenta que la I es la suma de f(x)*c , no w(x)*f(x)*c.
  # INPUT
  # f: función a integrar
  # n: Número de nodos que queremos utilizar para la estimación.
  # k: Constante que aparece si hacemos cambios de variable
  coefsN = coefLaguerre(n)
  coefsM = coefLaguerre(m)
  I =  0
  I =  0
  for i in range(0,n):
      for j in range(0,m):
          I = I + coefsN["ci"][i]*coefsM["ci"][j]*f(coefsN["roots"][i], coefsM["roots"][j]) 
  return(I*kn*km)


f = lambda x,y : sin(x/10)+sin(y/10)
n = 4
m = 4
kn = 1/10
km = 1/10

print(gaussLaguerreD(f,n,m,kn,km))