function [cons] = ordine_multistep(a, b)
% [cons] = ordine_multistep(a, b)
%
% Input:
% -> a: lista dei coef di Aj a partendo da A0
% -> b: lista dei coef di Bj a partendo da B-1
cons=0;
if(sum(a)~=1)
    cons=0;
else
    i=0;
    go=1;
    while(go==1)
        i=i+1;
        %calcolo coef sommatoria con Aj
        sumA=0;
        index=0;
        for j=0:length(a)-1
            index=index+1;
            sumA=sumA+(-j)^i*a(index);
        end

        sumB=0;
        index=0;
        for j=-1:length(b)-2
            index=index+1;
            sumB=sumB+(-j)^(i-1)*b(index);
        end
        if sumA+i*sumB~=1
            go=0;
        else
            cons=i;
        end

    end
end
