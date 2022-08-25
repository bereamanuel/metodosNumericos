import math 

def derivadaTaylor(xi,f = lambda x : x, orden = 1, index = None, sol = None):
    """
    Vamos a implementar el método de diferenciación por Taylor.

    Input: 
        - xi: Vector de puntos.
        - f: función a diferenciar.
        - orden: orden de la derivada.
        - index: Lugar donde aparece el punto que queremos estimar. 
        Por ejemplo, si tenemos [0,0.25,0.5,0.75,1] y queremos calcular el error para 0.5,
        entonces index debe ser 2, ya que aparece en la posición 2, [0 1 2 3 4]
        - sol: El valor que toma la derivada en el punto que queremos calcular el error.

    Output:
        - Diccionario con los resultados de la extrapolación, en caso de rellenar index y sol, nos devuelve
        un vector con los errores cometidos en cada uno de los métodos
    """
    import numpy as np
    import math
    xi = np.array(xi)
    n = len(xi)

    #Gerenamos los valores de los nodos en la función
    fi = np.array([f(i) for i in xi])

    #Los nodos deben ser equiespaciados
    h = xi[1]-xi[0]
    try:
        if orden == 1:
            #Generamos la derivada progresivas de orden 1, con 1 y 2 pasos.
            dph = (1/h)*(fi[1:n] - fi[0:n-1])
            dph2 = (1/2/h)*(-fi[2:n] + 4*fi[1:n-1] - 3*fi[0:n-2])

            #Generamos las diferencias regresivas
            drh = (1/h)*(-fi[0:n-1] + fi[1:n])
            drh2 = (1/2/h)*(fi[0:n-2] - 4*fi[1:n-1] + 3*fi[2:n])

            #Generamos las diferencias centrales
            dch2 = (1/2/h)*(fi[2:n]-fi[0:n-2])
            dch4 = (1/12/h)*(-fi[4:n]+8*fi[3:n-1]-8*fi[1:n-3] + fi[0:n-4])
            if sol and index:
                return({"Prog Oh" : dph, 
                        "Prog Oh2" : dph2 ,  
                        "Rege Oh" : drh , 
                        "Rege Oh2" : drh2,
                        "Cent Oh2" : dch2 , 
                        "Cent Oh4" : dch4 ,
                        "e" : [ abs(sol-dph[index]), abs(sol-dph2[index]), 
                                abs(sol-drh[index-1]), abs(sol-drh2[index-1]), 
                                abs(sol-dch2[index-2]), abs(sol-dch4[index-2]) ]})
            else:
                return({"Prog Oh" : dph, 
                        "Prog Oh2" : dph2 ,  
                        "Rege Oh" : drh , 
                        "Rege Oh2" : drh2,
                        "Cent Oh2" : dch2 , 
                        "Cent Oh4" : dch4})
        elif orden == 2:
            #Generamos la derivada progresivas de orden 1, con 1 y 2 pasos.
            dph = (1/(h**2))*(fi[2:n] - 2*fi[1:n-1] + fi[0:n-2])
            dph2 = (1/(h**2))*(-fi[3:n] + 4*fi[2:n-1] - 5*fi[1:n-2] + 2*fi[0:n-3])

            #Generamos las diferencias regresivas
            drh = (1/(h**2))*(fi[0:n-2] - 2*fi[1:n-1] + fi[2:n])
            drh2 = (1/(h**2))*(2*fi[0:n-3] - 5*fi[1:n-2] + 4*fi[2:n-1] - fi[3:n])

            #Generamos las diferencias centrales
            dch2 = (1/(h**2))*(fi[2:n] - 2*fi[1:n-1] + fi[0:n-2])
            dch4 = (1/12/(h**2))*(-fi[4:n] + 16*fi[3:n-1] - 30*fi[2:n-2] + 16*fi[1:n-3] - fi[0:n-4])

            if sol and index:
                return({"Prog Oh" : dph, 
                        "Prog Oh2" : dph2 ,  
                        "Rege Oh" : drh , 
                        "Rege Oh2" : drh2,
                        "Cent Oh2" : dch2 , 
                        "Cent Oh4" : dch4 ,
                        "e" : [ abs(sol-dph[index]), abs(sol-dph2[index]), 
                                abs(sol-drh[index-1]), abs(sol-drh2[index-1]), 
                                abs(sol-dch2[index-2]), abs(sol-dch4[index-2]) ]})
            else:
                return({"Prog Oh" : dph, 
                        "Prog Oh2" : dph2 ,  
                        "Rege Oh" : drh , 
                        "Rege Oh2" : drh2,
                        "Cent Oh2" : dch2 , 
                        "Cent Oh4" : dch4})
        elif orden == 3:
            #Generamos la derivada progresivas de orden 1, con 1 y 2 pasos.
            dph = (1/(h**3))*(fi[3:n] - 3*fi[2:n-1] + 3*fi[1:n-2] - fi[0:n-3])
            dph2 = (1/2/(h**3))*(-3*fi[4:n] + 14*fi[3:n-1] - 24*fi[2:n-2] + 18*fi[1:n-3] - 5*fi[0:n-4])

            #Generamos las diferencias regresivas
            drh = (1/(h**3))*(fi[0:n-3] - 3*fi[1:n-2] + 3*fi[2:n-1] - fi[3:n])
            drh2 = (1/2/(h**3))*(5*fi[0:n-4] - 18*fi[1:n-3] + 24*fi[2:n-2] - 14*fi[3:n-1] + 3*fi[4:n])

            #Generamos las diferencias centrales
            dch2 = (1/2/(h**3))*(fi[4:n] - 3*fi[3:n-1] + 3*fi[1:n-3] - fi[0:n-4])
            dch4 = (1/8/(h**3))*( -fi[6:n] + 8*fi[5:n-1] -13*fi[4:n-2] + 13*fi[2:n-4] -8*fi[1:n-5] + fi[0:n-6])

            if sol and index:
                return({"Prog Oh" : dph, 
                        "Prog Oh2" : dph2 ,  
                        "Rege Oh" : drh , 
                        "Rege Oh2" : drh2,
                        "Cent Oh2" : dch2 , 
                        "Cent Oh4" : dch4 ,
                        "e" : [ abs(sol-dph[index]), abs(sol-dph2[index]), 
                                abs(sol-drh[index-1]), abs(sol-drh2[index-1]), 
                                abs(sol-dch2[index-2]), abs(sol-dch4[index-2]) ]})
            else:
                return({"Prog Oh" : dph, 
                        "Prog Oh2" : dph2 ,  
                        "Rege Oh" : drh , 
                        "Rege Oh2" : drh2,
                        "Cent Oh2" : dch2 , 
                        "Cent Oh4" : dch4})
        else:
            return("No se ha programado para mayor que orden 3")
    except:
        return("We need more points")

print(derivadaTaylor([0,0.25,0.5,0.75,1], lambda x : x**2*math.exp(-x), orden = 1 , index = 2, sol= 0.4549))
