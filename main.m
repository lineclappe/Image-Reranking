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
sum_ap0 = 0;
sum_ap1 = 0;
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
        %%
        %Caluclate the MAP
        AP0 = CalculateMAP(gindex,gdata,num_img);
        AP1 = CalculateMAP(index,gdata,num_img);
        sum_ap0 = AP0 + sum_ap0;
        sum_ap1 = AP1 + sum_ap1;
    end
end

sum_ap0 = sum_ap0 / 353
sum_ap1 = sum_ap1 / 353
		      
        