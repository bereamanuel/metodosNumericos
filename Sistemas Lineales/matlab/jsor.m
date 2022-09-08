function [x, i] = jsor(A,B,x0,w,tol,maxiter)

%Vamos a resolver Ax=b por método de JSOR

i = 1;
stop = tol+1;
D = diag(A);
iM = diag(1./D) ;

while i<maxtier && stop > tol
    r = n - A*x0;
    x = x0 + w*(iM*r);
    stop = norm(x-x0,inf)/norm(x0,inf)
    i = i+1;
    x0 = x;
end
end