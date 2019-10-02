% MECH 7011 Class Project 1
% 
% reproduce.m
% This is the main body of the GA algorithm
%
% Author: Xiahua Liu

function new=reproduce(family)
  
  new=family();
  
  for i=1:(family.length)/2
    p1=family.pop().item;
    p2=family.pop().item;
    
    [p1,p2,o1,o2]=crossover(p1,p2);
    
    new.push(p1);
    new.push(p2);
    new.push(o1);
    new.push(o2);
  end
  
  if family.length != 0 % If the family have odd number of members
    new.push(family.pop());
  end
end

function [father, mother, son, daughter]=crossover(p1,p2)
  align_path(p1);
  align_path(p2);
end

function px=mutate(p1)
  
end