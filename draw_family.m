% MECH 7011 Class Project 1
% 
% family_draw.m
% This script accepts a family object then draw all the path on the map.
% The purpose of this function is to make debugging easier
% 
% Author: Xiahua Liu

function draw_family(family)
  close all
  global population;
  
  for i=1:population
    draw_path(family.pop());
  end
end
