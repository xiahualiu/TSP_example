% MECH 7011 Class Project 1
% 
% map_gen.m
% This part generate map according to the N number
% All cities lie on the [1-100] area
%
% Author: Xiahua Liu

function map = map_gen(N)
  for i=1:N
    map(1,i)=city(1,round(100*rand()),round(100*rand()));
  end
end