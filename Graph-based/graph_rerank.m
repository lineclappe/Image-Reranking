function rank = graph_rerank(sim_mat,conf_list)
%Re-Arrange the similarity matrix according to the conf_list
num_img = size(sim_mat,1);
new_mat = zeros(num_img,num_img);
for i = 1:num_img
		ii = conf_list(i);
		for j = 1:num_img
				jj = conf_list(j);
				new_mat(i,j) = sim_mat(ii,jj);
				new_mat(j,i) = sim_mat(jj,ii);
		end
end
order_rank = prim(new_mat);
rank = zeros(num_img,1);
for i = 1:num_img
		orank = order_rank(i);
		rank(i) = conf_list(orank);
end
