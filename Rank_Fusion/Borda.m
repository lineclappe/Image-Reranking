%conducting the borda count fusion
function output = Borda(rank)
num_img = size(rank,1);
output = zeros(num_img,2);
for i = 1:num_img
    score = (num-i)/(num-1);
    index = rank(i);
    output(index,2) = score;
end

