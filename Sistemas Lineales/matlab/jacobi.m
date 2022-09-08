function [x, i] = jacobi(A,B,x0,tol,maxiter)

%Vamos a resolver Ax=b por método de Jacobi

i = 1;
stop = tol+1;

% A = L+D+U
L = tril(A,-1);
U = triu(A,1);
D = diag(A);

iM = diag(1./D) ;
N = - (L+U);

while i<maxtier && stop > tol
    x = iM*N*x0 + iM*b;
    stop = norm(x-x0,inf)/norm(x0,inf)
    i = i+1;
    x0 = x;
end
end