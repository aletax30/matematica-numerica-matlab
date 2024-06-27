function nodi=nodi_cgl(a,b,n)
nodi_=[];
for i = 0:(n-1)
    nodi_=[nodi_ -cos((i*pi)/(n-1))];
end
nodi=(a+b)/2 +((b-a)/2)*nodi_