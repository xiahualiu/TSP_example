classdef node % Not subject to handle class, every method return a new object.
    properties
        visited_set;
        distance;
        not_visited_set;
    end
    
    methods
        function obj=node(N)
            obj.visited_set=uint32([1]);
            obj.distance=double(0);
            obj.not_visited_set=2:N;
        end
        
        function obj=add_city(self,city_num,dist_table)
            obj=self;
            % Add the next city into the set
            obj.visited_set=[city_num, self.visited_set];
            % Add the distance to the old distance
            obj.distance=self.distance+dist_table.get_dist(self.visited_set(1), city_num);
            % Remove input city in not_visited_set
            [~, index]=find(obj.not_visited_set==city_num);
            obj.not_visited_set(index)=[];
        end
        
        % Overload less than and great than operator
        function tf=lt(node1,node2)
            tf=node1.distance<node2.distance;
        end
        
        function tf=gt(node1,node2)
            tf=node1.distance>node2.distance;
        end
        
        % Calculate key if needed
        function key=get_key(self)
            key=[self.visited_set(1), self.one_hot];
            key=num2str(key);
        end
        % One hot encode
        function code=one_hot(self)
            bit1=uint32(1);
            code=uint32(0);
            for i=self.visited_set
                code=bitor(code, bitshift(bit1, i-1));
            end
        end
    end
end