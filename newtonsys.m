function [x,it] = newtonsys(x0,nmax,toll,fun,J)
% [x, it] = newtonsys(x0, nmax, toll, fun, J)
%
% Metodo di Newton per la funzione fun.
% Test d'arresto basato sulla norma infinito dell'incremento tra due iterate successive.
%
% Input:
% -> x0: Dato iniziale (Vettore colonna)
% -> nmax: Numero massimo di iterazioni
% -> toll: Tolleranza sul test d'arresto
% -> fun, J: Anonymous function contenenti la funzione vettoriale (vettore colonna) e la sua Jacobiana
%
% Output:
% -> x: Soluzione approssimata
% -> it: Iterazioni effettuate
x = x0;
err = toll+1;
it = 0;
while it < nmax && err > toll
    xv = x;
    Jxv = J(xv);
    if det(Jxv) == 0
        error(' Arresto per Jacobiano singolare');
    end
    x = xv - Jxv \ fun(xv);
    err = norm(x - xv, Inf);
    it = it + 1;
end
fprintf('Numero di Iterazioni: %d\n', it);
fprintf('Zero calcolato: %-12.13f\n', x(1));
for i=2:length(x)
    fprintf(' %-12.13f \n', x(i));
end
return