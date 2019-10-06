% MECH 7011 Class Project 1
% 
% reproduce.m
% This is the main body of the GA algorithm
%
% Author: Xiahua Liu

function new=reproduce(family)
  
  new=family();
  
  for i=1:(family.length)/2
    p1=family.pop();
    p2=family.pop();
    
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
  init=[];
  edge_table=containers.Map; % Empty container
  len=length(p1.num_list);
  
  keyboard();
  
  for i=1:(len-1) % Forward connect
    if edge_table.isKey(p1.num_list(i))
      edge_table(num2str(p1.num_list(i))).insert(p1.num_list(i+1));
    else
      temp = edges; % Create right hand edges
      temp.insert(p1.num_list(i+1));
      edge_table(num2str(p1.num_list(i))) = temp;
    end
  end

  for i=2:len % Backward connect
    if edge_table.isKey(p1.num_list(i))
        keyboard();
      edge_table(num2str(p1.num_list(i))).insert(p1.num_list(i-1));
    else
      temp = edges; % Create right hand edges
      edge_table(num2str(p1.num_list(i))) = temp.insert(p1.num_list(i-1));
    end
  end

  edge_table(num2str(p1.num_list(1))).insert(p1.num_list(len));
  edge_table(num2str(p1.num_list(len))).insert(p1.num_list(1));
  
  keyboard();
end

function px=mutate(p1)
  
end