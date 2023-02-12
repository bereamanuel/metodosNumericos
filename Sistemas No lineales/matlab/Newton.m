function [sol,iter,ACOC] = Newton(f,x0,tol,maxiter)
% Con esta funcion vamos a implementar el metodo de Newton
% para sistemas de ecuaciones no lineales.
% INPUT:
%   - f (Funcion)   : Sistema de ecuaciones que queremos resolver, del tipo:
%       function [F,dF] = f(x)
%       F = ... ; dF = ... ;
%       donde f es la funcion, df la priemra derivada y d2f la segunda derivada
%   - x0(Number)    : Aproximacion de la solución para empezar el metodo.Vector!!
%   - tol(Number)   : Tolerancia del metodo
%   - maxiter(Num)  : Numero maximo de iteraciones
% OUTPUT:
%   - sol(Number)   : Raiz de la ecuacion.
%   - iter(Number)  : Numero de iteraciones empleadas.
%   - ACOC(Number)  : Orden de convergencia.

% Inicializacion de variables
digits(200);
iter = 1;
incre1 = tol+1;
incre2 = tol+2;
x0 = x0(:);
[Fx,dFx] = feval(f,x0);

% Definimos el criterio de parada.
while incre1>tol && incre2>tol && iter<maxiter
    % Expresion del metodo de Newton.
    % Aqui debemos modificar para definir el metodo en caso de querer utilizar otro.
    x = x0 - dFx\Fx;
    incre1 = norm(x-x0);
    I(iter) = incre1;

    % Actualizacion de la estimacion
    x0 = x;
    [Fx,dFx]=feval(f,x0);
    incre2 = norm(Fx);
    
    % Incremento del contador de iteraciones
    iter = iter+1;
end

%   Calculo del ACOC

if length(I)>2
    sol = x;
    ACOC = log(I(3:end)./I(2:end-1))./log(I(2:end-1)./I(1:end-2));
else 
    disp('Necesito mas iteraciones')
end
end

