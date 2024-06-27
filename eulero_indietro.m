function [th,uh]=eulero_indietro(a,b,t_0,t_max,y0,h)
% [th, uh] = eulero_indietro(a, b, t_0, t_max, y0, h)
%-------
%uh(:,it) = (uh(:,it-1) + h*b(th(it)))./(1-h*a(th(it)));
%------
% Metodo di Eulero Indietro
% (Eulero Implicito) : u^{n+1}=u^n+h*f^{n+1}.
% uh(:,it) = (uh(:,it-1) + h*b(th(it)))./(1-h*a(th(it)));
% Input:
% -> a,b: function che descrivono il problema di Cauchy
% (f = ay+b)
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
    uh(:,it) = (uh(:,it-1) + h*b(th(it)))./(1-h*a(th(it)));
end

