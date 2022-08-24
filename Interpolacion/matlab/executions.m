% Executions
xi =1971:10:2011;
fi =[33.956 37.743 39.434 40.847 46.816 ];

[ai,bi,ci,di,p]  = splines(xi,fi)

[coef,pnew] = newton(xi,fi);

[plag] = lagrange(xi,fi);


xi =[0 .5 1];
fi =[1 .9385 .7652 ];
dfi =[0 -.2423 -.4401 ];

p= hermite(xi ,fi ,dfi);