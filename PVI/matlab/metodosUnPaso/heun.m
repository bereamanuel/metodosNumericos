function [t,y] = heun(f,a,b,y0,N)
%Este método calcula el resultado del problema del valor inicial de %una función dada en un intervalo, mediante el método de Heun
%INPUT:
% f: Función que queremos calcular (una EDO)
% a,b: intervalo donde está definida la solución de nuestro problema
% y0: Valor inicial
% N: Número de intervalos
%OUTPUT:
% t : Vector puntos
% y : Solución
h = (b-a)/N;
t = a:h:b; %Intervalo de puntos desde a, hasta b, con paso h.
t = t(:); %Para que sea vector columna.
n=length(y0);
y = zeros(N+1,n); %Vector solución
y(1,:) = y0; %Condicion inicial
for k=1:N
   [fx0, dfx0] = feval(f,t(k,:), y(k,:));
   k1 = h.*fx0;
   [fx1, dfx1] = feval(f,t(k+1,:), y(k,:)+k1);
   k2 = h.*fx1;
   y(k+1,:)=y(k,:)+ k1/2 + k2/2;
end
end
