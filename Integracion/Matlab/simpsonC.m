function I=simpsonC(f,a,b,n)
% Fórmula de Simpson compuesta
% INPUTS:
% f: función a integrar
% a: Inicio del intervalo
% b: Fin del intervalo
% n: Número de subintervalos

h=(b-a)/n; 
x=a:h:b;
pesos=ones(1,n+1); 
pesos(2:2:n)=4; 
pesos(3:2:n-1)=2;
I=h/3*sum(pesos.*f(x));
end
