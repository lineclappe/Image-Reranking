%Print out the results under different truncated level T
function res = get_result(index,gdata,T)
num_img = size(gdata,1);
num_level = length(T)+1;
res = zeros(num_level,1);
for i = 1:num_level - 1
      value = CalculateMAP(index,gdata,T(i));
      res(i) = value;
end
res(num_level) = CalculateMAP(index,gdata,num_img);
    