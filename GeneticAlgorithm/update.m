% MECH 7011 Class Project 1
% 
% draw_path.m
% This script accepts a path object from workspace then draw the path on the plot.

function update(path)

  global fh; 
  global sh;
  global ph;
  global N;
  
  % get new plot data
  x_dots=zeros(1,N);
  y_dots=zeros(1,N);
  
  x_vec=zeros(1,N+1);
  y_vec=zeros(1,N+1);
  
  for i=1:N
    x_dots(1,i)=path.city_info(1,path.num_list(1,i)).get_x();
    y_dots(1,i)=path.city_info(1,path.num_list(1,i)).get_y();
  end
  

  for i=1:N
    x_vec(i)=path.city_info(path.num_list(i)).get_x();
    y_vec(i)=path.city_info(path.num_list(i)).get_y();
  end
  
  x_vec(i+1)=path.city_info(path.num_list(1)).get_x();
  y_vec(i+1)=path.city_info(path.num_list(1)).get_y();
  
  % refresh
  
  set(sh,'XData',x_dots,'YData',y_dots);
  set(ph,'XData',x_vec,'YData',y_vec);
  set(fh, 'Name', ['The total distance is  ', num2str(path.distance)]);
  drawnow
  %legend({'Other City', 'Path', 'Start City'});
end
