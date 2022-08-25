def splinesCubicos(xi,fi):
    """
    Función para calcular la interpolación por splines cubicos.
    Necesitamos los puntos y sus valores para poder ejecutarla.
    
    Como output, vamos a obtener los coeficientes. 
    """
    import numpy as np
    import pandas as pd

    xi = np.array(xi)
    fi = np.array(fi)
    n  = len(xi)

    #Definimos h_i =  x_{i+1} - x_i
    hi  = np.diff(xi)
    #Definimos a_i = fi
    ai  = fi
    #Definimos las diagonales de A, es decir dP, dI, dS para nuestro algoritmo de crout
    ## Diagonal Superior
    dS  = np.insert(hi,0,0)
    ## Diagonal Pincipal
    if n>3 :
        h0  = hi[0:n-2]
        h1  = hi[1:n-1]
        auxdP = 2*(h0+h1)
        dP  = np.insert(np.insert(auxdP,0,1),n-1,1)
        del(h0)
        del(h1)
        del(auxdP)
    else:
        dP  = np.insert(np.insert(2*(hi[0]+hi[1]),0,1), n-2,1)
    
    ## Diagonal Inferior
    dI  = np.insert(hi[0:(n-2)], n-2,0)

    #Calculamos b
    a0  = np.diff(ai[0:n-1])/hi[0:n-2]
    a1  = np.diff(ai[1:n])/hi[1:n-1]
    b  = 3*np.insert(np.insert((a1-a0),0,0),n-1,0)

    #Calculamos ci por crout
    ci  = Crout(dP,dS,dI,b)

    #Calculamos b_i
    bi  = ((1/hi)*(ai[1:n]-ai[0:n-1]))-((hi/3)*(2*ci[0:n-1]+ci[1:n]))

    #Calculamos d_i
    di  = (np.diff(ci)/(3*hi))

    return([ai,bi,ci,di])
    


xi = [x for x in range(1971,2021,10)]

fi =[33.956 ,37.743 ,39.434 ,40.847, 46.816 ]

ai,bi,ci,di = splinesCubicos(xi, fi)

print(ai)
print(bi)
print(ci)
print(di)