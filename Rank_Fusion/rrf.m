function output = rrf(rank)
num_img = size(rank,1);
output = zeros(num_img,2);
for i = 1:num_img
    index = rank(i);
    score = 1/(60+i);
    output(index,2) = score;
end

