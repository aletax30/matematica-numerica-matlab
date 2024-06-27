function [th,uh]=eulero_avanti(f,t_0,t_max,y0,h)
% [th, uh] = eulero_avanti(f, t_0, t_max, y0,h)
%-------
%uh(:,it) = uh(:,it-1) + h*f(th(it-1),uh(:,it-1));
%------
% Metodo di Eulero in Avanti
% (Eulero Esplicito) : u^(n+1)=u^n+h*f^n
%
% Input:
% -> f: function che descrive il problema di Cauchy
% Deve ricevere in ingresso due argomenti: f=f(t,y)
% -> t_0: l'istante iniziale dell' intervallo temporale di soluzione
% -> t_max: l'istante finale dell' intervallo temporale di soluzione
% -> y0: il dato iniziale del problema di Cauchy
% -> h: l'ampiezza del passo di discretizzazione temporale.
%
% Output:
% -> th: vettore degli istanti in cui si calcola la soluzione discreta
% -> uh: la soluzione discreta calcolata nei nodi temporali t_h
% vettore degli istanti in cui risolvo la edo

th = t_0:h:t_max;
N = length(th);
uh = [y0, zeros(size(y0,1),N-1)];

for it = 2:N % ciclo in tempo
    uh(:,it) = uh(:,it-1) + h*f(th(it-1),uh(:,it-1));
end

