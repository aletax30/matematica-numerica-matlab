function [ordine] = ordine_formula_quadratura(x, w, a, b)
% [ordine] = ordine_formula_quadratura(x, w, a, b)
%
% Input:
% -> x: nodi 
% -> w: coeff che moltiplicano x
% -> a, b: estremi integrazione
%
% NOTA: x,w sono VETTORI COLONNA

for n = 1:10
    f = @(x) x.^n
    int_exact = integral(f, a, b);
    int_approx = w' * f(x);
    int_approx - int_exact
    if abs(int_approx - int_exact) >= 1e-4
        break
    end
end
ordine = n-1;