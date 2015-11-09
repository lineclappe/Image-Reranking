%The main function
addpath('Visual Rank');
addpath('Feature');
addpath('Similarity');
addpath('Data_Analyse');
img_path = 'G:\LINBIN_DATA\DCNN_O';
sim_path = 'G:\LINBIN_DATA\simmat';
%%
%load the similarity matrix
sim_dir = dir(sim_path);
T_level = [5,10,20,40,60,80,100];
num_level = length(T_level) + 1;
%%
sum_ap0 = zeros(num_level,2);
sum_ap1 = zeros(num_level,2);
sum_ap2 = zeros(num_level,2);
sum_ap3 = zeros(num_level,2);
sum_ap0(1:num_level-1,1) = T_level';
sum_ap1(1:num_level-1,1) = T_level';
sum_ap2(1:num_level-1,1) = T_level';
sum_ap3(1:num_level-1,1) = T_level';
for i = 1:length(sim_dir)
    file_name = sim_dir(i).name;
	if(strcmp(file_name,'.') == false && strcmp(file_name,'..')==false)
        sim_file = fullfile(sim_path,file_name);
        %%
        %Get the index of the query
        index1 = strfind(file_name,'_');
        index2 = strfind(file_name,'.');
        query = str2num(file_name(index1+1:index2-1))
        %load the GroundTruth Data
        gdata = GData(query);
        load(sim_file);
        %%
        %1. Don't re-rank the images
        num_img = size(sim_mat,1);
        gindex = zeros(num_img,1);
        for ii = 1:num_img
            gindex(ii) = ii;
        end
        %2.Using Visual_Rank to re-rank the images
        %Baseline method        
        rankscore = VisualRank(sim_mat,0.85,30);        
        [rank,index] = sort(rankscore,'descend');
        %3.Adaptive weighting vector selection
        [rel,d] = QDETune(sim_mat);
        rankscore2 = VisualRank(sim_mat,0.85,rel);        
        [rank2,index2] = sort(rankscore2,'descend');
        %4.Adaptive tune both factors at the same time
        rankscore3 = VisualRank(sim_mat,d,rel);
        [rank3,index3] = sort(rankscore3,'descend');
         
        %%
        %Caluclate the MAP
        AP0 = get_result(gindex,gdata,T_level);
        AP1 = get_result(index,gdata,T_level);
        AP2 = get_result(index2,gdata,T_level);
        AP3 = get_result(index3,gdata,T_level);
        sum_ap0(:,2) = AP0 + sum_ap0(:,2);
        sum_ap1(:,2) = AP1 + sum_ap1(:,2);
        sum_ap2(:,2) = AP2 + sum_ap2(:,2);
        sum_ap3(:,2) = AP3 + sum_ap3(:,2);
    end
end

sum_ap0(:,2) = sum_ap0(:,2) / 353;
sum_ap1(:,2) = sum_ap1(:,2) / 353;
sum_ap2(:,2) = sum_ap2(:,2) / 353;
sum_ap3(:,2) = sum_ap3(:,2) / 353;
		      
        
