function [xk, k] = richardson_iterate(A, b, P, x0, tol, nmax, alpha)
% [xk, k] = richardson_iterate(A, b, P, x0, tol, nmax, alpha)
%
% Metodo di Richardson statico precondizionato
% Input:
% -> A: matrice di sistema
% -> b: vettore termine noto
% -> P: precondizionatore
% -> x0: guess iniziale
% -> tol: tolleranza criterio d'arresto
% -> nmax: numero massimo di iterazioni ammesse
% -> alpha: parametro di accelerazione
%
% Output:
% xk: matrice le cui colonne sono i vettori della soluzione ad ogni iterazione
% k: numero di iterazioni

n = length(b);
if ((size(A,1) ~= n) || (size(A,2) ~= n) || (length(x0) ~= n))
  error('Dimensioni incompatibili')
end

% E' possibile utilizzare una sola variabile x al posto di xn e xv viste
% nel laboratorio precedente.

x = x0;
k = 0;
r    = b - A * x;
res_normalizzato  = norm(r) / norm(b);
xk = [x0];

while ((res_normalizzato > tol) && (k < nmax))
     z = P \ r;
     x = x + alpha * z;
     r = b - A * x; % equivalente a: r = r - alpha * A * z;
     res_normalizzato  = norm(r) / norm(b);
     k = k + 1;
     xk = [xk, x];  
end

if (res_normalizzato < tol)
     fprintf('Richardson converge in %d iterazioni \n', k);
else
     fprintf('Richardson non converge in %d iterazioni. \n', k)
end
