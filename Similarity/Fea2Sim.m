%Turning Feature Matrix into Similarity Matrix
function sim = Fea2Sim(fea)
num_img = size(fea,1);
dim = size(fea,2);
sim = zeros(num_img,num_img);
for i = 1:num_img
    fea1 = fea(i,:);
    for j = i+1 : nu_img
        fea2 = fea(j,:);
        simvalue = CalculateSim(fea1,fea2);
        sim(i,j) = simvalue;
        sim(j,i) = simvalue;
    end
end

        