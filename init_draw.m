% MECH 7011 Class Project 1
% 
% init_draw.m
%
% Author: Xiahua Liu

function init_draw()

  global fh; 
  global sh;
  global ph;
  
  fh=figure(1);
  sh=scatter(0,0);
  hold on
  ph=plot(0,0);

  grid on
  
end