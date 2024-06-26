function [Lambda_n] = costante_lebesgue(x, a, b)
% [Lambda_n] = costante_lebesgue(x, a, b)
% 
% Input: 
% -> x: lista dei nodi dell'interpolazione
% -> a,b: estremi intervallo

xx = linspace(a, b, 1000);
n = length(x)-1;
L = zeros(n+1, length(xx));
for ii=1:n+1
   Li = ones(size(xx));
   for jj = 1:n+1
        if ii ~= jj
            Li = Li .* (xx - x(jj)) / (x(ii) - x(jj));
        end
    end
    L(ii, :) = Li;
end

lebesgue_function = sum(abs(L),1);

% Plot della funzione di legesgue nell'intervallo [a,b]
% plot(xx, lebesgue_function);
% xlabel('x');
% ylabel('\Lambda(x)');
% title('Funzione di Lebesgue');
% grid on;

% Costante di Lebesgue
Lambda_n = max(lebesgue_function);