function I=trapeciosS(f,a,b)
% Fórmula de Trapecios simple
% INPUTS:
% f: función a integrar
% a: Inicio del intervalo
% b: Fin del intervalo

h=(b-a);
I=h/2*(f(a)+f(b));
end
