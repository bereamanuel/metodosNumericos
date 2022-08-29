function I=PuntoMedio(f,a,b,n)
% Fórmula de punto medio compuesta
% INPUTS:
% f: función a integrar
% a: Inicio del intervalo
% b: Fin del intervalo
% n: Número de subintervalos, debe ser par

h=(b-a)/(n+2);
x=a+h:h:b-h;
I=2*h*sum(f(x(1:2:end)));
end

