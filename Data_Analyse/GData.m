%Analyze the data
%function GData
function rec_query = GData(query)
label_dir = 'G:/LINBIN_DATA/labels.txt';
Table = load(label_dir);
%Extract the given query from the table
corres = find(Table(:,1) == query);
query_part = Table(corres(1):corres(length(corres)),:);
%order the set according to the number of the image
rec_query = sortrows(query_part,2);

