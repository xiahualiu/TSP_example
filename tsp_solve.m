% MECH 7011 Class Project 1
% 
% tsp_solve.m
% This is the main body of the GA algorithm
%
% Author: Xiahua Liu

function best_path=tsp_solve(map)
  
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
  
  keyboard();
  
  reproduce(generation);
  
  draw_family(generation); % Debug print
  
%  for circle=1:1000
%   big_generation=reproduce(generation); % Reproduce
%   next_generation=select(big_generation); % Select Good Ones
%   end

  best_path=0; % Make sure to return something before exiting
end
