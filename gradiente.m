function [x, k] = gradiente(A, b, P, x0, tol, nmax)
% [x, k] = gradiente(A, b, P, x0, tol, nmax)
%z = P \ r;
%alpha = (z' * r) / (z' * A * z);
% Metodo di Richardson dinamico precondizionato
% con parametro ottimale (metodo del gradiente).
%
% Input:
% -> A: matrice di sistema
% -> b: vettore termine noto
% -> P: precondizionatore
% -> x0: guess iniziale
% -> tol: tolleranza criterio d'arresto
% -> nmax: numero massimo di iterazioni ammesse
%
% Output:
% -> x: soluzione
% -> k: numero di iterazioni

n = length(b);
if ((size(A,1) ~= n) || (size(A,2) ~= n) || (length(x0) ~= n))
    error('Dimensioni incompatibili')
end
% E' possibile utilizzare una sola variabile x al posto di xn e xv viste
% nel laboratorio precedente.
x = x0;
k = 0;
r = b - A * x;
res_normalizzato = norm(r) / norm(b);
while ((res_normalizzato > tol) && (k < nmax))
    z = P \ r;
    alpha = (z' * r) / (z' * A * z); % alpha dinamico
    x = x + alpha * z;
    r = b - A * x; % equivalente a: r = r - alpha * A * z;
    res_normalizzato = norm(r) / norm(b);
    k = k + 1;
end
if (res_normalizzato < tol)
    fprintf('Gradiente converge in %d iterazioni \n', k);
else
    fprintf('Gradiente non converge in %d iterazioni. \n', k)
end