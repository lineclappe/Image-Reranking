function final_rank  = generate_ranks(sim_mat,conf_rank,num)
num_img = size(sim_mat,1);
ranks = zeros(num_img,num);
for i = 1:num
     grank =graph_rerank(sim_mat,conf_rank);
     ranks(:,i) = grank;
     temp = conf_rank(i+1);
     conf_rank(i+1) = conf_rank(1);
     conf_rank(1) = temp;
end
final_rank = rank_fusion(ranks);
     
    
