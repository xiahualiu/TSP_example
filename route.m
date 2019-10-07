% MECH 7011 Class Project 1
% 
% path.m
% This file define a class of path, which is a vectors of cities
%
% Author: Xiahua Liu

classdef route
  properties (SetAccess = private)
    city_info; % constant value
  end
  
  properties (SetAccess = public)
    distance; % distance
    num_list; % vector of city numbers
  end
  
  methods
    function obj=route(city_vec)
      obj.city_info=city_vec;
      obj.num_list=uint32(1:length(city_vec)); % Initial value is 1:N
      obj.distance=obj.dist(); % Initial value of distance
    end
    
    function new_obj=re_arrange(obj,new_order) % path change return a new path
      new_obj=obj; % Copy
      if length(obj.num_list) ~= length(new_order)
        error('The new route is not valid')
      else
        new_obj.num_list=uint32(new_order);
        new_obj.distance=new_obj.dist(); % Initial value of distance
      end
    end
    
    function val=dist(obj) % Calculate the total travel distance
      val=0;
      for i=1:(length(obj.num_list)-1)
        val=val+...
            sqrt((obj.city_info(1,obj.num_list(1,i)).get_x()-obj.city_info(1,obj.num_list(1,i+1)).get_x())^2+...
                 (obj.city_info(1,obj.num_list(1,i)).get_y()-obj.city_info(1,obj.num_list(1,i+1)).get_y())^2);
      end
      val=val+...
          sqrt((obj.city_info(1,obj.num_list(1,1)).get_x()-obj.city_info(1,obj.num_list(1,length(obj.num_list))).get_x())^2+...
               (obj.city_info(1,obj.num_list(1,1)).get_x()-obj.city_info(1,obj.num_list(1,length(obj.num_list))).get_x())^2);
    end
  end
end
