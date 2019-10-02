% MECH 7011 Class Project 1
% 
% align_path.m
% This is function align the path at the beginning city number 1
%
% Author: Xiahua Liu

function result=align_path(path)
  
  temp=path.num_list;
  
  for temp(1,1)!=1
    tail=temp(1,length(temp));
    for i=1:length(temp)
      temp(1,i+1)=temp(1,i);
    end
    temp(1,1)=tail;
  end
end
