function [xvect, it] = punto_fisso( phi, x0, toll, kmax )
% [xvect, it] = punto_fisso(phi, x0, toll, kmax)
%
% Metodo di Punto Fisso tramite phi
% 
% Input:
% -> phi : funzione scalare che accetta una variabile scalare in input
% -> x0 : approssimazione iniziale
% -> toll : tolleranza per il criterio d'arresto (basato sull'incremento)
% -> kmax : numero massimo di iterazioni concesso
%
% Output: 
% -> xvect: vettore contenente le it+1 iterate del metodo
% -> it: numero di iterazioni

xvect = x0;
err = toll+1;
it = 0;
while it < kmax && err > toll
    xvect(it+2) = phi( xvect(it+1) );
    err = abs( xvect(it+2) - xvect(it+1) );
    it = it+1;
end
return