function [t_h,u_h]=rungekutta_2(f,t0,t_max,y_0,h)
% [t_h, u_h] = rungekutta_2(f, t_max, y_0, h)
%
% Metodo Runge-Kutta 2:
% u^*_(n+1) = u_n + h * f_n
% u_(n+1) = u_n + h/2 * (f_n + f(t_(n+1), u^*_(n+1)))
%
% Input:
% -> f: function che descrive il problema di Cauchy
% Deve ricevere in ingresso due argomenti: f=f(t,y)
% -> t0: l'istante iniziale dell' intervallo temporale di soluzione
% -> t_max: l'istante finale dell' intervallo temporale di soluzione
% -> y_0: il dato iniziale del problema di Cauchy
% -> h: l'ampiezza del passo di discretizzazione temporale.
%
% Output:
% -> t_h: vettore degli istanti in cui si calcola la soluzione discreta
% -> u_h: la soluzione discreta calcolata nei nodi temporali t_h

% vettore degli istanti in cui risolvo la edo
t_h = t0:h:t_max;

% inizializzo il vettore che conterra' la soluzione discreta 
N_istanti = length(t_h);
u_h = zeros(1,N_istanti);

% ciclo iterativo
u_h(1) = y_0;

for it = 2:N_istanti
    u_old = u_h(it - 1);
    % step intermedio
    u_s = u_old + h * f(t_h(it - 1), u_old);
    % step finale
    u_h(it) = u_old + 0.5 * h * ( f(t_h(it - 1),u_old) + f(t_h(it), u_s));
end