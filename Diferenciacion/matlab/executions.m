% Executions
h = 0.25;
x=0:h:1;
f = @(x) (x.^2).*exp(-x);
orden = 1;

[dph, dph2, drh, drh2, dch2, dch4] = derivadaTaylor(x, f, orden);