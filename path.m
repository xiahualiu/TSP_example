% MECH 7011 Class Project 1
% 
% path.m
% This file define a class of path, which is a vectors of cities
%
% Author: Xiahua Liu

classdef path
  properties (SetAccess = private)
    city_info; % constant value
    num_list; % vector of city numbers
  end
  
  methods
    function obj=path(city_vec)
      obj.city_info=city_vec;
      obj.num_list=1:length(city_vec); % Initial value is 1:N
    end
    
    function obj=re_arrange(obj,new_order) % path change return a new path
      if length(obj.num_list) ~= length(new_order)
        error("The new path is not valid")
      else
        obj.num_list(1:length(obj.num_list))=new_order;
      end
    end
    
    function val=distance(obj) % Calculate the total travel distance
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
