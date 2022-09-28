function [nodos ,solaprox ,t,iter ] = DisparoSecante (funcion ,a,b,alfa ,beta ,n,tol , maxiter )
h=(b-a)/(n+1);  x=a:h:b;  x=x(:);
t0 =0;
[x,Y]= ode45 (funcion ,x ,[ alfa , t0]');
yb0=Y(end ,1);
t1 =(beta - alfa)/(b-a);
[x,Y]= ode45 (funcion ,x ,[ alfa ,t1]');
yb1=Y(end ,1);
iter =1; incre =tol+1;
while incre >tol && iter < maxiter
t=t1 -(t1 -t0)*(yb1 -beta )/(yb1 -yb0); 
[x,Y]= ode45 (funcion ,x ,[ alfa ,t]');
incre =abs(Y(end ,1) -beta);
iter= iter +1;
t0=t1; yb0=yb1;
t1=t; yb1=Y(end ,1);
end
if incre <= tol
nodos =x;
solaprox =Y;
else
disp('se necesitan mas iteraciones ')
end
end
