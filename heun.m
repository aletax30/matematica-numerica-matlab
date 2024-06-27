function [th, uh] = heun(f, t_0, t_max, y0, h)
% [th, uh] = heun(f, t_0, t_max, y0, h)
%--- 
%th(it)=th(it-1)+h;
%    uh(it)=uh(it-1)+ ...
%    h/2*(f(th(it-1),uh(it-1)) + f(th(it), uh(it-1)+h*f(th(it-1),uh(it-1))));
%--- 
% Metodo di Heun
% (Heun) : u^(n+1)=u^n+h/2*(f^{n+1} + f(t,u^n+hf^n) )
%
% Input:
% -> f: function che descrive il problema di Cauchy
% (dichiarata ad esempio tramite inline o @).
% Deve ricevere in ingresso due argomenti: f=f(t,y)
% -> t_0: l'istante iniziale dell' intervallo temporale di soluzione
% -> t_max: l'istante finale dell' intervallo temporale di soluzione
% -> y0 : il dato iniziale del problema di Cauchy
% -> h : l'ampiezza del passo di discretizzazione temporale.
%
% Output:
% -> th: vettore degli istanti in cui si calcola la soluzione discreta
% -> uh: la soluzione discreta calcolata nei nodi temporali t_h

it=1;
th(it)=t_0;
uh(it)=y0;

for it=2:(t_max-t_0)/h+1
    th(it)=th(it-1)+h;
    uh(it)=uh(it-1)+ ...
    h/2*(f(th(it-1),uh(it-1)) + f(th(it), uh(it-1)+h*f(th(it-1),uh(it-1))));
end