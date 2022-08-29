trapeciosS <- function(f,a,b){
    # Fórmula de Trapecios simple
    # INPUTS:
    # f: función a integrar
    # a: Inicio del intervalo
    # b: Fin del intervalo

    h=(b-a)

    return( h/2*(f(a)+f(b)) )

    }

print(trapeciosS(function(x) x+3 ,-1, 4))