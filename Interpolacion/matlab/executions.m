% Executions
xi =1971:10:2011;
fi =[33.956 37.743 39.434 40.847 46.816 ];

[coef,pnew] = newton(xi,fi);

[plag] = lagrange(xi,fi);