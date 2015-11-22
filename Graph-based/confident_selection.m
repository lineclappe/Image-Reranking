function index = confident_selection(sim_mat)
num_img = size(sim_mat,1);
scores = zeros(num_img,1);
for i = 1:num_img
    scores(i) = sum(sim_mat(i,:)) - sim_mat(i,i);
end
 [rank,index] = sort(scores,'descend');
    