%Calculate the similarity value between two features
function value = CalculateSim(fea1,fea2)
%Calculate the distance between two features
dis =(norm(fea1-fea2))^2;
value = 1/(dis+0.5);
