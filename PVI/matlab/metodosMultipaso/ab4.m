function [t,y] = am4(f,a,b,N,y0)
% Vamos a definir el método de Adams Bashforth de orden 4
% INPUT:
% f: Función que queremos calcular (una EDO)
% a,b: intervalo donde está definida la solución de nuestro problema
% y0: Valor inicial
% N: Número de intervalos
%OUTPUT:
% t : Vector puntos
% y : Solución

h = (b-a)/N;
t = a:h:b;
t = t(:);
y = zeros(N+1,1);
y(1)=y0;
maxiter = 10;
tol = 1e-6;
%Utilizamos el método Runge-Kutta para los dos pimeros pasos
for k=1:3
   k1 = feval(f,t(k,:), y(k,:));
   k2 = feval(f,t(k,:) + h/2, y(k,:)+(h*k1)/2);
   k3 = feval(f,t(k,:) + h/2, y(k,:)+(h*k2)/2);
   k4 = feval(f,t(k+1,:), y(k,:) + h*k3);
   y(k+1,:)=y(k,:)+ h/6*(k1 + 2*k2 + 2*k3 + k4);
end
%Los siguientes pasos aplicamos el método am4
for k=3:N 
    y(k+1) = y(k) + h/24*(55*feval(f,t(k),y(k)) -59*feval(f,t(k-1),y(k-1)) + 37*feval(f,t(k-2),y(k-2)) -9*feval(f,t(k-3),y(k-3)) );
end
end
