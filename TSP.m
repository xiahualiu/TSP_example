% MECH 7011 Class Project 1
% 
% TSP.m
% This script controls the main steps of the solution.
% 1. Map Generation 2. Solving 3. Result Display
%
% Author: Xiahua Liu

function TSP(N)
  
  map=map_gen(N); % Map is a vector contains cities
  
  path=tsp_solve(map); % path is a ordered list
  
  draw_path(path); % Draw path
  
end