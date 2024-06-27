function [xn,iter]=jacobi(A,b,x0,nmax,toll)

% [xn, iter] = jacobi(A, b, x0, nmax, toll)
%
% Metodo di Jacobi
% Componenti: Xi passo k+1 = 1/Aii *(bi- sommatoria(Aij*Xj passo k, j=1:N j!=i)
% xn(i) = ( b(i) - A(i,[1:i-1,i+1:n])*xv([1:i-1,i+1:n]) )/A(i,i);
% Input:
% -> A Matrice del sistema
% -> b Termine noto (vettore colonna)
% -> x0 Vettore iniziale (vettore colonna)
% -> nmax Numero massimo di iterazioni
% -> toll Tolleranza sul test d'arresto (residuo normalizzato)
%
% Output:
% -> xn Vettore soluzione
% -> iter Iterazioni effettuate
%
% Viene usata la norma 2

[n,m] = size(A);
if n ~= m
error (' >> La matrice non e'' quadrata !!! ')
end
xv = x0;
xn = x0;
iter = 0;
err = toll + 1;
normb = norm(b);
while iter < nmax && err > toll
for i=1:n
xn(i) = ( b(i) - A(i,[1:i-1,i+1:n])*xv([1:i-1,i+1:n]) )/A(i,i);
end
iter = iter + 1;
err = norm(b - A*xn)/normb;
xv = xn;
end
end