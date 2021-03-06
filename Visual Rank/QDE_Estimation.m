%The procedure of query difficulty estimation using coherence score
function cos_score = QDE_Estimation(sim_mat, T)
%%
%%%Calculate the Trsim
%simpath = 'G:\LINBIN_DATA\simmat';
%v = SimThresh(simpath);
thresh = 0.6294;
%%
num_img = size(sim_mat,1);
if T > num_img
    cos_score = -1;
else
    cos_score = 0;
    for i = 1:T
        for j = 1:T
            sim = sim_mat(i,j);
            if sim > thresh
                cos_score = cos_score + 1;
            end
        end
    end
    cos_score = cos_score / (T*(T-1));

end






function value = SimThresh(sim_path)
%load the similarity value of the dataset
%For web353, the value equals to 0.6294
fea_dir = dir(sim_path);
sim_pairs = [];
for i = 1:length(fea_dir)
    fea_name = fea_dir(i).name;
    if(strcmp(fea_name,'.') == true || strcmp(fea_name, '..')==true)
        continue;
    end
    fea_path = fullfile(sim_path,fea_name);
    load(fea_path);
    num_img = size(sim_mat,1);
    for ii = 1:num_img
        for jj = ii+1:num_img
            sim_pairs = [sim_pairs; sim_mat(ii,jj)];
        end
    end
end
[Y,I] = sort(sim_pairs,1,'ascend');
num_pairs = length(sim_pairs);
value_index = floor(num_pairs*0.8);
value = sim_pairs(value_index);
