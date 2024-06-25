function [xvect, it] = corde(a, b, x0, kmax, toll, fun)
% [xvect, it] = corde(a, b, x0, kmax, toll, fun)
%
% Metodo delle corde per la risoluzione
% dell'equazione non lineare f(x)=0
%
% Input:
% -> a,b: estremi intervallo di ricerca radice
% -> x0: punto di partenza
% -> kmax: numero massimo di iterazioni
% -> tol: tolleranza sul test d'arresto (basato sull'incremento)
% -> fun: function handle che rappresenta la funzione f
%
% Output:
% -> xvect: vettore contenente tutte le iterate
% -> calcolate (l'ultima componente e' la soluzione)
% -> it: iterazioni effettuate
%
rappinc = (fun(b)-fun(a))/(b-a); % pendenza costante
xvect = x0;
err = toll+1;
it = 0;
while it < kmax && err > toll
    it = it+1;
    x = x0 - fun(x0)/rappinc;
    xvect = [xvect; x];
    err = abs(fun(x));
    x0 = x;
end