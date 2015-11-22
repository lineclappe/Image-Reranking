function final_rank = rank_fusion(ranks)
num_img = size(ranks,1);
num_rank = size(ranks,2);
scores = zeros(num_img,1);

for i = 1:num_rank
		rank = ranks(:,i);
		output = rrf(rank);		
		scores = scores + output(:,2);
end
%rank
[rank,final_rank] = sort(scores,'descend');

		
