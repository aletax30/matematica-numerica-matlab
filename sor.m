function [xn,iter]=sor(A,b,x0,nmax,toll,omega)
% [xn, iter] = sor(A, b, xin, nmax, toll, omega)
%
% Metodo SOR
% Per omega uguale a 1 si ottiene il metodo di Gauss Seidel
% Componenti:Xi passo k+1 = 1/Aii *[sommat(Aij*Xj passo k+1, j=1:i-1)-sommat(Aij*Xj passo k +bi, j=i+1:n)]
%xn(i) = (1-omega)*xv(i) + (omega/A(i,i))*...
%(b(i) - A(i,1:i-1)*xn(1:i-1) - A(i,i+1:n) * xv(i+1:n));
% Input:
% -> A Matrice del sistema
% -> b Termine noto (vettore colonna)
% -> x0 Vettore iniziale (vettore colonna)
% -> nmax Numero massimo di iterazioni
% -> toll Tolleranza sul test d'arresto (fra iterate)
% -> omega Parametro di rilassamento
%
% Output:
% -> xn Vettore soluzione
% -> iter Iterazioni effettuate

[n,m] = size(A);
if n ~= m
error (' >> La matrice non e'' quadrata !!! ')
end
xv = x0;
xn = x0;
iter = 0;
err = toll +1;
normb = norm(b);
while iter < nmax && err > toll
for i=1:n
xn(i) = (1-omega)*xv(i) + (omega/A(i,i))*...
(b(i) - A(i,1:i-1)*xn(1:i-1) - A(i,i+1:n) * xv(i+1:n));
end
iter = iter + 1;
err = norm(b - A*xn)/normb;
xv = xn;
end
if iter==nmax,
disp('**SOR non converge nel numero di iterazioni fissato**')
end