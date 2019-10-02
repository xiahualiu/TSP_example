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
  
  % Initial family null
  generation=family();
  
  % Add family member to the first generation
  for i=1:population
    rand_list=randperm(cnt-1,cnt-1); % Generate random list
    temp=path(map);
    generation.push(member(temp.re_arrange(rand_list)));
  end
  
  for i=1:population
    draw_path(generation.pop().item);
  end
  
  
end
