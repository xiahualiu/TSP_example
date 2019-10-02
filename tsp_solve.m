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
  
  % Add family member to the initial generation
  for i=1:population
    rand_list=randperm(cnt,cnt); % Generate random list
    temp=path(map);
    generation.push(member(temp.re_arrange(rand_list)));
  end
  
  draw_family(generation); % Debug print
  
##  for circle=1:1000
##    big_generation=reproduce(generation); % Reproduce
##    next_generation=select(big_generation); % Select Good Ones
##  end
##  

  
  path=0; % Make sure to return something before exiting
end
