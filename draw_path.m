% MECH 7011 Class Project 1
% 
% draw_path.m
% This script accepts a path object then draw the path on the plot.
%
% Author: Xiahua Liu

function draw_path(path)
  for i=1:length(path.num_list)
    x_vec(1,i)=path.city_info(1,path.num_list(1,i)).get_x();
    y_vec(1,i)=path.city_info(1,path.num_list(1,i)).get_y();
  end
  
  figure;
  scatter(x_vec(1,2:length(path.num_list)),y_vec(1,2:length(path.num_list)),'g','filled');

  x_vec(1,length(path.num_list)+1)=path.city_info(1,path.num_list(1,1)).get_x();
  y_vec(1,length(path.num_list)+1)=path.city_info(1,path.num_list(1,1)).get_y();
  
  hold on
  plot(x_vec,y_vec,'r');
  
  scatter(x_vec(1,1),y_vec(1,1),'r','s','filled');
  
  title(['The total distance is  ', num2str(path.distance())]);
  grid on
  legend({"Other City", "Path", "Start City"});
end
