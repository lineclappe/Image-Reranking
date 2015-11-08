function rank = VisualRank(sim,d,rel)
num = size(sim,1);
rank = ones(num,1);
iter_time = 100;
%column normalize the matrix
for i = 1:num
    fea = sim(:,i);
    fea = fea./sum(fea);
    sim(:,i) = fea;
end
%parameters settings
p = zeros(num,1);
%In case when num is smaller than rel
rnum = min(rel,num);
for i = 1:rnum
    p(i) = 1/rnum;
end
i = 0;
while i < iter_time
    rank = d*sim*rank + (1-d)*p;
    i = i+ 1;
end

    
      