def simpsonD(f,a,b,c,d,n,m):
    # Fórmula de Simpson Doble
    # INPUTS:
    # f(x,y): función a integrar 
    # a: Inicio del intervalo en x
    # b: Fin del intervalo en x
    # n: Número de subintervalos en x
    # c: Inicio del intervalo en y
    # d: Fin del intervalo en y
    # m: Número de subintervalos en y
    import numpy as np 

    h = (b-a)/n
    k = (d-c)/m

    x= np.insert(np.arange(a, b, h),n,b)
    y= np.insert(np.arange(c, d, k),m,d)
    #Construimos la matriz de pesos
    w = np.ones([n,m])
    w1= np.expand_dims(np.insert(np.insert(np.array([2,4]*(m)), 0,1)[0:m],m,1),axis=0)
    w2= np.insert(np.insert(np.array([16,8]*(m)), 0,4)[0:m],m,4)
    w3= np.insert(np.insert(np.array([8,4]*(m)), 0,2)[0:m],m,2)
    w = np.concatenate((np.concatenate((w1,np.array([list(w2),list(w3)]*n)[0:n-1,:] )) ,w1))
    del(w1)
    del(w2)
    del(w3)

    #Calculamos la integral
    I = 0
    for i in range(0,n+1):
        for j in range(0,m+1):
            I = I + f(x[i],y[j])*w[i,j]
    I = ((h*k)/9)*I
    return( I )

def f(x,y):
    from math import sqrt 
    return( sqrt( (x**2 + y**2)/(9 - x**2 - y**2) ) )

a = 0
b = 1
c = 0
d = 1
n = 8
m = 8

print(simpsonD(f,a,b,c,d,n,m))