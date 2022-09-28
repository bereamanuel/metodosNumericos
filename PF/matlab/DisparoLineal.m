function [x,y]=DisparoLineal(PVI1,PVI2,a,b,n,alfa,beta)
h=(b-a)/n;
x=a:h:b;
x=x(:);

[x,Y1]=ode45(PVI1,x,[alfa,0]');
[x,Y2]=ode45(PVI2,x,[0,1]');
y=Y1(:,1)+((beta-Y1(end,1))/Y2(end,1))*Y2(:,1);
end