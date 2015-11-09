%Calculate the MAP value under certain truncated level T
function value = CalculateMAP(rank,data,T)
num_rel = 0;
num_img = size(rank,1);
full_rel =  sum(data(:,3)==1);
map = 0;
count = 0;
level = min(T,num_img);
for i = 1:level
    seq = rank(i,1);
    rel = data(seq,3);
    count = count + 1;
    num_rel = num_rel + rel;
    if rel == 1        
        map = map + num_rel/count;
    end
end
if num_rel == 0
    value = 0;
else
  %   value = map /level;
    if T >=full_rel
         value = map / full_rel;
     else
         value = map / T;
     end
end