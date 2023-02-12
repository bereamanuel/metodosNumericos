function [F,dF] = ejemplo1(X)
x = X(1);
y = X(2);
F = [exp(x).*exp(y)+x.*cos(y) ; x+y-1];
%Aqui es el jacobiano
dF= [exp(x).*exp(y)+cos(y),exp(x).*exp(y)-x.*sin(y);1,1];
end
