% MECH 7011 Class Project 1
% 
% TSP.m
% This script controls the main steps of the solution.
% 1. Map Generation 2. Solving 3. Result Display

function TSP(N)
  
  map=map_gen(N); % Map is a vector contains cities
  
  best=tsp_solve(map); % path is a ordered list
  
end