% MECH 7011 Class Project 1
% 
% tsp_solve.m
% This is the main body of the GA algorithm
%
% Author: Xiahua Liu

function path=tsp_solve(map)
  % Make initial population
  cnt=length(map);
  
  % get population from workspace
  global population;
  
  for i=1:population
    rand_list=randperm(cnt,cnt); % Generate random list for the first evolution generation
    for i=1:cnt
      temp=re_arrange(map,rand_list);
    end
  end
  
end
