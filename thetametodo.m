function [th, uh] = thetametodo(a, b, t_0, t_max, y0, h, theta)
% [th, uh] = thetametodo(a, b, t_0, t_max, y0, h, theta)
%
% Theta-metodo

th = t_0:h:t_max;  % vettore dei tempi
N = length(th);    % numero di passi temporali

uh = zeros(1, N);  % inizializzazione del vettore delle soluzioni
uh(1) = y0;        % condizione iniziale

for it = 2:N  % ciclo in tempo
    t_n = th(it-1);
    t_n1 = th(it);
    y_n = uh(it-1);

    % Definire f(t, y)
    f_n = a * y_n + b * t_n;
    % Definire il passo iterativo
    uh(it) = (y_n + h * (1 - theta) * f_n) / (1 - h * theta * a);
end
end
