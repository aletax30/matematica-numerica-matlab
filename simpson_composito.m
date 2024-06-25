function I = simpson_composito(a, b, N, f)
% I = simpson_composito(a, b, N, f)
%
% Formula di Simpson composita:
% Input:
% -> a,b: estremi di integrazione,
% -> N: numero di sottointervalli (N=1 formula di integrazione semplice)
% -> f: funzione da integrare definita come inline o anonimous
% Output:
% -> I: integrale calcolato

h = ( b - a ) / N;
x = linspace(a,b,2*N+1); % vettore dei nodi di integrazione
y = f( x );
I = ( h / 6 ) * ( y( 1 ) + ...
        2 * sum( y( 3 : 2 : 2 * N - 1 ) ) + ...
        4 * sum( y( 2 : 2 : 2 * N ) ) + ...
        y( 2 * N + 1 ) );
