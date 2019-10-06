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
  
  if family.length ~= 0 % If the family have odd number of members
    new.push(family.pop());
  end
end

function [father, mother, son, daughter]=crossover(p1,p2)
  edge_table=container.Map; % Empty container

  for i=1:length((p1.num_list)-1) % Forward connect
    if edge_table.isKey(p1.num_list(i))
      edge_table(p1.num_list(i)).insert(p1.num_list(i+1));
    else
      temp = edges; % Create right hand edges
      edge_table(p1.num_list(i)) = temp.insert(p1.num_list(i+1));
    end
  end

  for i=2:length((p1.num_list)) % Backward connect
    if edge_table.isKey(p1.num_list(i))
      edge_table(p1.num_list(i)).insert(p1.num_list(i-1));
    else
      temp = edges; % Create right hand edges
      edge_table(p1.num_list(i)) = temp.insert(p1.num_list(i-1));
    end
  end

  
end

function px=mutate(p1)
  
end