function [nodos ,solaprox ,t,iter ] = DisparoNewton (funcion ,a,b,alfa ,beta ,n,tol , maxiter )
%
h=(b-a)/(n+1); x=a:h:b; 
t0 =0;
[x,Y]= ode45 (funcion ,x ,[alfa ,t0,0,1]');
yb1=Y(end ,1); 
zb1=Y(end ,3);
iter=1; 
incre =tol +1;
while incre >tol && iter < maxiter
t=t0 -(yb1 -beta )/(zb1); %Metodo de Newton
[x,Y]= ode45 (funcion ,x ,[ alfa ,t ,0 ,1]');
incre =abs(Y(end ,1) -beta);
iter= iter +1;
t0=t; 
yb1=Y(end ,1); 
zb1=Y(end ,3);
end
if incre <= tol
nodos =x; solaprox =Y;
else
disp('se necesitan mas iteraciones ')
end
end