function [x, i] = sor(A,B,x0,w,tol,maxiter)

%Vamos a resolver Ax=b por método de SOR

k = 1;
stop = tol+1;
n = length(x0);

% A = L+D+U
L = tril(A,-1);
U = triu(A,1);
D = diag(A);

M = (D + w*L) ;
N = (-w*U + (1-w)*D);

while k<maxtier && stop > tol
    x = zeros(n,1);
    d = w*b + N%*%x0;
    B = M;
    x(1) = d(1)/M(1,1);
    for i=2:n
        s = 0;
        for j=1:n-1
            s = s+M(i,j)*x[j]
        end
        x[i] = (d(i)-s)/M(i,i)
    end
    stop = norm(x-x0,inf)/norm(x0,inf)
    k = k+1;
    x0 = x;
end
end