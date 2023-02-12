function [f,df,d2f] = ejemplo1(x)
f = (cos(x)).^2-x;
df =2*cos(x).*(-sin(x))-1;
d2f = 2*(sin(x)).^2 + -2*(cos(x)).^2;
end
