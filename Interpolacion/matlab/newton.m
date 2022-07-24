function [coef,p] = newton(xi,fi)
%Implementación del método de Newton
xi=xi(:);
fi=fi(:);
n = length(xi);
syms x

col = 2;
p = fi(1);
vx = 1;

DD=zeros(n);
DD(:,1)=fi;

for k=2:n
    for j=k:n
        DD(j,k) = (DD(j,k-1) - DD(j-1,k-1))/(xi(j) - xi(j-k+1));
    end
end

while col<=n
    vx = vx*(x-xi(col-1));
    p = p+DD(col,col)*vx;
    col=col+1;
end
coef = diag(DD);
end