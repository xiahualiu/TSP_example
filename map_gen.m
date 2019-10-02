% MECH 7011 Class Project 1
% 
% map_gen.m
% This part generate map according to the N number
% All cities lie on the [1-100] area
%
% Author: Xiahua Liu

function city_map = map_gen(N)
  
  for i=1:N
    city_map(1,i)=city(i,round(100*rand()),round(100*rand()));
  end
  
end