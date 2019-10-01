% MECH 7011 Class Project 1
% 
% city.m
% This part define the city class
% All cities lie on the [1-100] area
%
% Author: Xiahua Liu

classdef city
  properties (SetAccess = private)
  
    num  % The number of the city
    x    % The x value of the city
    y    % The y value of the city
  
  end
  
  methods (SetAccess = public)
    % Construtor
    function obj=city(n,x_value,y_value) 
      obj.num=n;
      obj.x=x_value;
      obj.y=y_value;
    end
    
    % get functions
    function x_value=get_x(obj)
      x_value=obj.x;
    end
    
    function y_value=get_y(obj)
      y_value=obj.y;
    end
    
    function number=get_num(obj)
      number=obj.num;
    end
    
    % There is no set function, once it is set, the value is constant
  end
end