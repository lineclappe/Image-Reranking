%Feature Combination
%Read through all the query documents
fea_path = 'G://LINBIN_DATA//DCNN_O';
query_doc = dir(fea_path);
for i = 1:length(query_doc)
    folder_name = query_doc(i).name;
	if(strcmp(folder_name,'.') == false && strcmp(folder_name,'..')==false)
			%load the feat file(not the jpg file)
			folder_path = fullfile(fea_path,folder_name);
			file_doc = dir(folder_path);
			for ii = 1:length(file_doc)
					file_name = file_doc(ii).name;
					if(strcmp(file_name,'.') == false && strcmp(file_name,'..')==false)
							fea_file = fullfile(folder_path,file_name);
							%get the postfix
							loc = strfind(fea_file,'feat');
                            if(size(loc,1)==0) continue;
                            end
                            %load the dcnn file
                            
                                
                    end
            end
							


	end
end



