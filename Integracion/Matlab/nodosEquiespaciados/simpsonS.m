function I=simpsonS(f,a,b)
% Fórmula de Simpson simple
% INPUTS:
% f: función a integrar
% a: Inicio del intervalo
% b: Fin del intervalo

h= (b-a)/2;
    
I = (h/3)*(f(a) + 4*f(((a+b)/2)) + f(b));

end
