% MECH 7011 Class Project 1
% 
% eliminate.m
% eliminate bad results in the samples

function winners=eliminate(sample, number)
  winners=family();
  temp=sample.all;
  dist_vec=[temp.distance];
  
  [out,index]=sort(dist_vec);
  
  for i=1:number
    winners.push(temp(index(i)));
  end
  
  disp(['The shorest distance in this generation is: ',num2str(out(1))])
  disp(['The shorest path is [ ', num2str(temp(find(index==1,1)).num_list),' ]'])
  

  global shortest_distance;
  shortest_distance=out(1);
  
  update(temp(index(1))); % Update best path

end