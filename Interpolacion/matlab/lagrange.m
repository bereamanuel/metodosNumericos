function [p] = lagrange(xi,fi)
%Implementación del método de Lagrange
xi=xi(:);
fi=fi(:);
n = length(xi);
syms x
col = 1;
p=0;
while col <= n
    vi = xi;
    vi(col) = [];
    L = (prod(x-vi)./prod(xi(col) - vi));
    p = p+L*fi(col);
    col = col+1;
end
end