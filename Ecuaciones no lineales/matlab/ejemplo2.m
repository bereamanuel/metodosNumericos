function [f,df,d2f] = ejemplo2(x)
f = (x-1).^3-1;
df =3.*(-1+x).^2;
d2f = 6.*(-1+x);
end