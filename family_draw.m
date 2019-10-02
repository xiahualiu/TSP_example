% MECH 7011 Class Project 1
% 
% family_draw.m
% This script accepts a family object then draw all the path on the map.
%
% Author: Xiahua Liu

function family_draw(family)
  close all
  global population;
  
  for i=1:population
    draw_path(family.pop().item);
  end
end
