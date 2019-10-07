% MECH 7011 Class Project 1
% 
% reproduce.m
% This is the main body of the GA algorithm
%
% Author: Xiahua Liu

function new_family=reproduce(old_family)
  
  new_family=family();
  shuffle(old_family);
  
  for i=1:(old_family.length)/2
    
    p1=old_family.pop();
    p2=old_family.pop();
    
    [p1,p2,o1]=crossover(p1,p2);
    
    new_family.push(p1);
    new_family.push(p2);
    new_family.push(o1);
    
    o2=mutate(o1);
    
    new_family.push(o2);
    
  end
  
  if old_family.length ~= 0 % If the family have odd number of members
    new_family.push(old_family.pop());
  end
  
end

function [father, mother, son]=crossover(p1,p2)
  
  father=p1;
  mother=p2;
  son=p1; % Intialize son, will be changed afterwards
  son_list=zeros(1,length(p1.num_list));
  
  edge_table=containers.Map(uint32(1),edges()); % Empty container
  remove(edge_table,1);
  
  len=length(p1.num_list);

  for i=1:(len-1) % Forward connect
    if edge_table.isKey(p1.num_list(i))
      temp=edge_table(p1.num_list(i)).insert(p1.num_list(i+1));
      edge_table(p1.num_list(i))=temp;
    else
      temp=edges();
      temp=temp.insert(p1.num_list(i+1));
      edge_table(p1.num_list(i))=temp;
    end
  end

  for i=2:len % Backward connect
    if edge_table.isKey(p1.num_list(i))
      temp=edge_table(p1.num_list(i)).insert(p1.num_list(i-1));
      edge_table(p1.num_list(i))=temp;
    else
      temp=edges();
      temp=temp.insert(p1.num_list(i-1));
      edge_table(p1.num_list(i))=temp;
    end
  end
  
  temp=edge_table(p1.num_list(1)).insert(p1.num_list(len));
  edge_table(p1.num_list(1))=temp;
  temp=edge_table(p1.num_list(len)).insert(p1.num_list(1));
  edge_table(p1.num_list(len))=temp;

  for i=1:(len-1) % Forward connect
    if edge_table.isKey(p2.num_list(i))
      temp=edge_table(p2.num_list(i)).insert(p2.num_list(i+1));
      edge_table(p2.num_list(i))=temp;
    else
      temp=edges();
      temp=temp.insert(p2.num_list(i+1));
      edge_table(p2.num_list(i))=temp;
    end
  end

  for i=2:len % Backward connect
    if edge_table.isKey(p2.num_list(i))
      temp=edge_table(p2.num_list(i)).insert(p2.num_list(i-1));
      edge_table(p2.num_list(i))=temp;
    else
      temp=edges();
      temp=temp.insert(p2.num_list(i-1));
      edge_table(p2.num_list(i))=temp;
    end
  end

  temp=edge_table(p2.num_list(1)).insert(p2.num_list(len));
  edge_table(p2.num_list(1))=temp;
  temp=edge_table(p2.num_list(len)).insert(p2.num_list(1));
  edge_table(p2.num_list(len))=temp;
  
  candidate=p1.num_list; % At first all cities are candidate
  
  for i=1:len
    % Choose the city with fewest adjacent cities
    choice=find_choice(edge_table,candidate);
    
    edge_temp=edge_table(choice);
    
    % Next city candidate
    candidate=edge_temp.get();
    remove(edge_table,choice);
    
    if isempty(candidate) % If no candidate, candidate becomes residual cities on table
      candidate=cell2mat(keys(edge_table));
    end

    for ii=cell2mat(keys(edge_table))
      temp=edge_table(ii);
      edge_table(ii)=temp.delete(choice);
    end
    
    son_list(i)=choice;
    
  end
  
  son=son.re_arrange(son_list);
  
end

function px=mutate(p1)
  random_order=randperm(length(p1.num_list)); 
  point=random_order(1); % first mutate point
  random_order=randperm(length(p1.num_list)); 
  another_point=random_order(1); % second mutate point
  
  temp_list=p1.num_list;
  temp=temp_list(point);
  temp_list(point)=temp_list(another_point);
  temp_list(another_point)=temp;
  
  px=p1.re_arrange(temp_list);
end

function min_key=find_choice(table, cand) % Output the choice of current table based on ER theory

  min_dist=inf;
  choice_cand=[];
  
  for i=cand
    temp=table(i);
    edge_len=length(temp.get());
    
    if edge_len == min_dist
      choice_cand=[choice_cand i];
    elseif edge_len < min_dist
      choice_cand=[i];
      min_dist=edge_len;
    end
  end

  len=length(choice_cand);
  k=randperm(len);
  min_key=choice_cand(k(1));
end