def newton(f,x0,tol,maxiter,df = lambda x: x):
    """
    Esta función es un genérico para poder resolver ecuaciones no lineales.
    Se debe modificar las partes comentadas para utilizar un método u otro. 
    INPUT:
        - f: Función a resolver.
        - df: Derivada de la función a resolver. (Siempre que se conozca.)
        - x0: Estimación inicial.
        - tol: Tolerancia del método.
        - maxiter: Máximo de iteraciones.
    OUTPUT:
        - x: Solución
        - i: Número de iteraciones.
        - ACOC: Coef. ACOC
    """
    from math import log
    from numpy import abs, array
    from numpy.linalg import norm

    #Empezamos el contador
    i = 1
    #Evaluamos la funcion para obtener los primeros valores.
    #Si df o esta definido, hará la identidad.
    fx0 = f(x0)
    dx0 = df(x0)

    #Creamos el criterio de parada
    incre1 = tol + 1
    incre2 = tol + 1
    #Para calcular el ACOC
    p = []
    while (i < maxiter and (incre1 > tol or incre2 > tol) ) : #Critero de parada + iteraciones
        #1: Aplicar metodo iterativo
        g = fx0
        dg = dx0
        x1 = x0 - g/dg
        #2: Actualizamos criterio de parada
        incre1 = abs(x1-x0)
        incre2 = abs(fx0)
        p.append(incre1)
        #3: Actualizamos estimacion inicial
        x0 = x1
        #4: Actualizamos los valores
        fx0 = f(x0)
        dx0 = df(x0)
        #5: +1 en iteracion
        i += 1
    #Calculamos el ACOC
    try:
        n = len(p)
        acoc =  log(norm(array(p[3:n]) - array(p[2:n-1]), ord = 1) / norm(array(p[2:n-1]) - array(p[1:n-2]), ord = 1) ) / log(norm(array(p[2:n-1]) - array(p[1:n-2]), ord = 1) / norm(array(p[1:n-2]) - array(p[0:n-3]), ord = 1) )
        
        return({"x":x0 ,
                "i":i,
                "ACOC": acoc})
    except:
        return({"x":x0 ,
                "i":i,
                "ACOC": "Elige otra norma"})

from math import sin, cos

f = lambda x : sin(x**2) - x**2 + 1
df = lambda x : 2*x*( cos(x**2) - 1)

x0 = 1

tol = 10**(-10)
maxiter = 100 

print(newton(f,x0,tol,maxiter,df))