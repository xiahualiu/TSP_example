classdef ant
    properties
        waiting_list;
        visited_list;
        distance;
    end
    
    methods
        function obj=ant(x, init_location)
            obj.waiting_list=1:x;
            obj.visited_list=[];
            obj.distance=0;
            obj=obj.goto(init_location, 0);
        end
        
        function obj=goto(self, next_city, cost)
            obj=self;
            obj.waiting_list(find(obj.waiting_list==next_city,1))=[];
            obj.visited_list=[next_city, obj.visited_list];
            obj.distance=obj.distance+cost;
        end
        
        function obj=goback(self, next_city, cost)
            obj=self;
            obj.visited_list=[next_city, obj.visited_list];
            obj.distance=obj.distance+cost;
        end
    end
end