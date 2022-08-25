function [df] = extrRich(xi, f, h, O)
%Implementación del derivada por extrapolación de Richardson. 
%xi es el vector de puntos, deben estar equiespaciados.
%f es la función a derivar.
%h es el paso que queremos aplicar.
%orden es el orden de error que queremos cometer.

xi = xi(:);
if O == 1
df = (1/h)*(f(xi+h)-f(xi)) ;  
elseif O == 2
df = (1/h)*(-f(xi+h)+4*f(xi+(h/2))-3*f(xi));
elseif O == 3
df = (1/h)*(f(xi+h)-12*f(xi+(h/2))+32*f(xi+(4/h))-21*f(xi));
else
print("No se ha programado para mayor que orden 3")
end
end

