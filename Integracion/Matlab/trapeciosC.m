function I=trapeciosC(f,a,b,n)
% Fórmula de Trapecios Compuesto
% INPUTS:
% f: función a integrar
% a: Inicio del intervalo
% b: Fin del intervalo
% n: Número de subintervalos

h=(b-a)/n;
x=a:h:b;
pesos=[1 2*ones(1,n-1) 1];
I=h/2*sum(pesos.*f(x));
end