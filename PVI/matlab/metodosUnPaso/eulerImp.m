function [t,y] = eulerI(f,a,b,y0,N, tol, maxiter)
%Este método calcula el resultado del problema del valor inicial de una
%función dada en un intervalo mediante el método de Euler Implicito. 
%INPUT:
% f: Función que queremos calcular (una EDO)
% a,b: intervalo donde está definida la solución de nuestro problema
% y0: Valor inicial
% N: Número de intervalos
% tol: Toleracia
% maxiter: Número máximo de iteraciones en el método
%
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
    x0 =y(k,:);
    iter = 1 ;
    dif = tol+1;
    %Calculamos la función implicita mediante Newton.
    %Salimos del bucle, cuando conseguimos un máximo de iteraciones o la
    %diferencia es menor a la tolerancia que especificamos.
    while iter < maxiter && dif >tol 
        [fx0, dfx0] = feval(f,t(k+1,:), x0);
        g = x0-y(k,:)-h.*fx0;
        dg= 1-h.*dfx0;
        x1 = x0 - g/dg;
        dif = abs(x1-x0);
        iter = iter +1 ;
        x0=x1;
    end

    y(k+1,:)=y(k,:)+h*feval(f,t(k+1), x0)';
end

end