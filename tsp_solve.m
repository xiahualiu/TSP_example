% MECH 7011 Class Project 1
% 
% tsp_solve.m
% This is the main body of the GA algorithm
%
% Author: Xiahua Liu

function best_path=tsp_solve(map)
  
  global loop_times;
  
  % Make initial population
  cnt=length(map);
  
  % get population from workspace
  global population;
  
  % Initial family null
  generation=family();
  
  % Add family member to the initial generation
  for i=1:population
    rand_list=randperm(cnt,cnt); % Generate random list
    temp=route(map);
    generation.push(temp.re_arrange(rand_list));
  end
  
  init_draw();
  
  for i=1:loop_times/2
    next=reproduce(generation);
    generation=eliminate(next,population);
    % keyboard();
  end

  best_path=0;
end
