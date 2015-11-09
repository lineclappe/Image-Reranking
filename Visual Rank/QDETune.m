function [rel,d] = QDETune(simmat)
%Tuning strategies
maxCos = 0;
for i = 1:100
    Cos = QDE_Estimation(simmat,i);
    if Cos > maxCos
        maxCos = Cos;
        rel = i;
    end
end
if rel <=10
    d = 0.15;
elseif rel <=50
    d = 0.4;
else
    d=0.8;
end
