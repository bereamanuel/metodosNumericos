function [t,y] = am4(f,a,b,N,y0)
% Vamos a definir el método de Adams Moulton de orden 4
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
for k=1:2
   [k1, dfx0] = feval(f,t(k,:), y(k,:));
   [k2, dfx1] = feval(f,t(k,:) + h/2, y(k,:)+(h*k1)/2);
   [k3, dfx2] = feval(f,t(k,:) + h/2, y(k,:)+(h*k2)/2);
   [k4, dfx0] = feval(f,t(k+1,:), y(k,:) + h*k3);
   y(k+1,:)=y(k,:)+ h/6*(k1 + 2*k2 + 2*k3 + k4);
end
%Los siguientes pasos aplicamos el método am4
for k=3:N 
    [fk, dfxk] = feval(f,t(k),y(k));
    [fkm1, dfxkm1] = feval(f,t(k-1),y(k-1));
    [fkm2, dfxkm2] = feval(f,t(k-2),y(k-2));
    iter = 1; dif = 1;
    x0= y(k);
    while and(iter<maxiter, dif>tol)
        [fx0, dfx0] = feval(f,t(k+1),x0);
        g = x0-y(k)-h/24*(fkm2-5*fkm1+19*fk +9*fx0);
        dg = 1-h/24*9*dfx0;
        x1=x0-g/dg;
        dif=abs(x1-x0);
        iter=iter+1;
        x0=x1;
    end
    y(k+1) = y(k) + h/24*(fkm2-5*fkm1+19*fk +9*feval(f,t(k+1),x0));
end
end
