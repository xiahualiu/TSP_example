classdef node_map < handle
  properties
    map; % Info about cities
  end
  
  methods
    function obj=node_map()
      obj.map=containers.Map('KeyType','uint32','ValueType','any');
    end
    
    function insert_city(self,num, location)
      self.map(num)=location;
    end
    
    function distance=get_dist(self,city1_num,city2_num)
      loc1=self.map(city1_num);
      loc2=self.map(city2_num);
      distance=norm(loc1-loc2);
    end
  end
end