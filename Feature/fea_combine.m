%Feature Combination
%Read through all the query documents
fea_path = 'G:/LINBIN_DATA/DCNN_O';
fea_comb = 'G:/LINBIN_DATA/Fea_Comb';
query_doc = dir(fea_path);
for i = 1:length(query_doc)
    folder_name = query_doc(i).name;
	if(strcmp(folder_name,'.') == false && strcmp(folder_name,'..')==false)
			%load the feat file           
            fea_comb_path = fullfile(fea_comb,[folder_name '.mat']);
            %the path to save the entire feature
			folder_path = fullfile(fea_path,folder_name);
			file_doc = dir(folder_path);
            num_of_img = (length(file_doc) - 2)/2;
            feat_mat = zeros(num_of_img,4096);
			for ii = 1:length(file_doc)
					file_name = file_doc(ii).name;
                    %get the index of the query
                    loc = strfind(file_name,'_');
					if(strcmp(file_name,'.') == false && strcmp(file_name,'..')==false)
                            query = str2num(file_name(loc(1)+1:loc(2)-1));                          
							fea_file = fullfile(folder_path,file_name);
							%get the postfix
							loc = strfind(fea_file,'feat');
                            if(size(loc,1)==0) continue;
                            end
                            %load the dcnn file
                            fea = read_featfile(fea_file);
                            feat_mat((ii-2)/2,:) = fea;                         
                                
                    end
            end
            %%saving the result
            save(fea_comb_path,'feat_mat');		


	end
end



