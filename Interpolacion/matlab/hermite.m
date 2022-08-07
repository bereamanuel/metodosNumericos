function [p]=hermite(xi,fi,dfi)

%Implementación del método de hermite de
xi=xi(:);
fi=fi(:);
cont = 1 ; 
for i=1:length(xi)*2
    z(i) = xi(cont);
    F(i) = fi(cont);
    if mod(i,2) == 0
        cont = cont + 1 ;
    end
end 
n = length(z);
syms x
col = 2;
p = fi(1);
vx = 1;

DD=zeros(n);
DD(:,1)=F;

for j=2:n
    if mod(j,2) == 1
        DD(j,2) = (DD(j,1) - DD(j-1,1))/(z(j) - z(j-1));
    else
        DD(j,2) = dfi(j/2);
    end
end


for k=3:n
    for j=k:n
        DD(j,k) = (DD(j,k-1) - DD(j-1,k-1))/(z(j) - z(j-k+1));
    end
end

while col<=n
    vx = vx*(x-z(col-1));
    p = p+DD(col,col)*vx;
    col=col+1;
end
end

    