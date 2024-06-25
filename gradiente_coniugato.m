function [x, k] = gradiente_coniugato(A, b, P, x0, tol, maxit);
% [x, k] = gradiente_coniugato(A, b, P, x0, tol, maxit)
%
% Metodo del Gradiente Coniugato 
% >> INPUT <<
%  A        (square) matrix
%  x0       starting solution
%  b        right-hand side
%  P        precoditioning matrix
%  maxit    maximum number of iterations
%  tol      tolerance required
%  
% >> OUTPUT <<
%  x         solution
%  k         number of iteration to reach the prescribed tolerance

flag = 0; k = 0; bnrm2 = norm( b );
x=x0;
r = b - A*x; error = norm( r ) / bnrm2;
if ( error < tol ) return, end
for k = 1:maxit 
    z  = P \ r; rho = (r'*z);
    if k > 1
       beta = rho / rho1;   p = z + beta*p;
    else
       p = z;
    end
    q = A*p;              alpha = rho / (p'*q );
    x = x + alpha * p;    r = r - alpha*q;
    error = norm( r ) / bnrm2;
    if ( error <= tol ), break, end
    rho1 = rho;
end
if ( error > tol ) flag = 1; end
return