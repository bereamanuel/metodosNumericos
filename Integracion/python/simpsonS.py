def simpsonS(f,a,b):
    # Fórmula de Simpson Simple
    # INPUTS:
    # f: función a integrar
    # a: Inicio del intervalo
    # b: Fin del intervalo

    h= (b-a)/2
    
    sol = (h/3)*(f(a) + 4*f(((a+b)/2)) + f(b))

    return( sol  )

print(simpsonS(lambda x: x+3 ,-1, 4))