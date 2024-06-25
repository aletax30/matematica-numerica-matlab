function I = ptomedio_composito(a, b, N, f)
% I = ptomedio_composito(a, b, N, f)
%
% Formula del Punto Medio Composita:
% Input:
% -> a,b: estremi di integrazione,
% -> N: numero di sottointervalli (N=1 formula di integrazione semplice)
% -> f: funzione da integrare definita come inline o anonimous
% Output:
% -> I: integrale calcolato
h=(b-a)/N;
%vettore dei nodi di integrazione:
%x = linspace(a,b,N+1);
x_pme = linspace(a+h/2,b-h/2,N);
I=h*(sum(f(x_pme)));
return