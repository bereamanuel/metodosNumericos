function [ai,bi,ci,di,p]  = splines(xi,fi)
    %Implementación del splines
    xi=xi(:);
    fi=fi(:);
    n = length(xi);

    syms x

    %Definimos h_i =  x_{i+1} - x_i
    hi  = diff(xi);

    %Definimos a_i = fi
    ai  = fi ;

    %Definimos las diagonales de A, es decir dP, dI, dS para nuestro algoritmo de crout
    %% Diagonal Superior
    dS  = [0;hi] ;

    %% Diagonal Pincipal
    if n>3
        h0  = hi(1:n-2);
        h1  = hi(2:n-1);
        auxdP = 2*(h0+h1);
        dP  = [1;auxdP;1] ;
    else 
        dP  = [1,2*(hi(1)+hi(2)),1];
    end
    %% Diagonal Inferior
    dI  = [hi(1:n-2);0];

    %% Calculamos b
    a0  = diff(ai(1:n-1))./hi(1:n-2);
    a1  = diff(ai(2:n))./hi(2:n-1);
    b  = 3*[0;(a1-a0);0];

    %% Calculamos ci por crout
    ci  = crout(dP,dS,dI,b) ;

    %% Calculamos b_i
    bi = ((1/hi).*(ai(2:n)-ai(1:n-1)))-((hi/3).*(2*ci(1:n-1)+ci(2:n)));
    bi = bi(:,1) ;
    %% Calculamos d_i
    di  = (diff(ci)./(3*hi));

    %% Creamos P

    syms x

    p = ai(1:n-1) + bi.*(x-xi(1:n-1)) + ci(1:n-1).*(x-xi(1:n-1)).^2 + di.*(x-xi(1:n-1)).^3;