function [nodos ,solaprox ,t,iter,incre ] = DisparoSecanteP1(funcion ,a,b,alfa ,beta ,n,tol , maxiter )
h=(b-a)/(n);  x=a:h:b;  x=x(:);
t0=1;
[x,Y]= ode45 (funcion ,x ,[ alfa , t0]');
yb0=Y(end ,1); 
ypb0=Y(end,2);
t1 =2;
[x,Y]= ode45 (funcion ,x ,[ alfa ,t1]');
yb1=Y(end ,1); 
ypb1=Y(end,2);
iter =0; 
incre =abs(yb1-ypb1-beta);
while incre >tol && iter < maxiter
t=t1 -((t1 -t0)*(yb1-ypb1-beta))./(yb1-ypb1-yb0+ypb0); 
[x,Y]= ode45 (funcion ,x ,[ alfa ,t]');
t0=t1;  
yb0=yb1;
t1=t; 
ypb0=ypb1;
yb1=Y(end ,1); 
ypb1=Y(end,2);
incre =abs(yb1-ypb1-beta);
iter= iter +1;
end
if incre <= tol
nodos =x;
solaprox =Y;
else
disp('se necesitan mas iteraciones ')
end
end
