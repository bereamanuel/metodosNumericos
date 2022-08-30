ptoMedioS <- function(f,a,b){
# Fórmula de punto medio simple
# INPUTS:
# f: función a integrar
# a: Inicio del intervalo
# b: Fin del intervalo
I = (b-a)*(f((a+b)/2))
return( I )
}

print(ptoMedioS(function(x) x+3 ,-1, 4))