function fea_m = read_featfile(fea_path)
%read the binary file
fid=fopen(fea_path,'rb');
dim = 4096;
fea_m = zeros(1,dim);
if fid == -1
    disp('error');    
else    
    [A,~]=fread(fid,'float');
    fclose(fid);
    %normalization 
    for i = 1:dim
        fea_m(i) = sqrt(A(i))/sum(A);
    end
end

