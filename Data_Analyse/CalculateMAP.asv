%Calculate the MAP value under certain truncated level T
function value = CalculateMAP(rank,data,T)
num_rel = 0;
num_img = size(rank,1);
map = 0;
count = 0;
T = min(T,num_img);
for i = 1:T
    seq = rank(i,1);
    rel = data(seq,3);
    count = count + 1;
    num_rel = num_rel + rel;
    if rel == 1
        map = map + num_rel/count;
    end
end
value = map / num_rel;