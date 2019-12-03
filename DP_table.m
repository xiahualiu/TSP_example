classdef DP_table < handle
    properties
        table; 
        cnt; % 2-norm counter
    end
    
    methods
        function obj=DP_table()
            obj.table=containers.Map();
            obj.cnt=0;
        end
        
        function insert(self,node) % Insert shorter path into table
            key=node.get_key();
            if self.table.isKey(key)
                if self.table(key)>node
                    self.table(key)=node;
                end
            else
                self.table(key)=node;
            end
        end
        
        function get_shortest_path(self)
            a=self.table.values;
            a=a{1};
            assert(length(a)==1,'Error: two optimal paths found in table');
            disp(['The optimal path is: ', num2str(a.visited_set)]);
            disp(['The shortest distance is: ', num2str(a.distance)]);
            disp(['We did 2-norm(distance) times: ', num2str(self.cnt)]);
        end
        
        function final_step(self,map)
            temp=self.table.values;
            for i=temp
                inode=i{1};
                temp_node=inode.add_city(1,map);
                self.cnt=self.cnt+1;
                self.insert(temp_node);
                self.table.remove(inode.get_key());
            end
        end
        
        function step(self,map)
            temp=self.table.values;
            for i=temp
                inode=i{1};
                for j=inode.not_visited_set
                    temp_node=inode.add_city(j,map);
                    self.cnt=self.cnt+1;
                    self.insert(temp_node);
                end
                self.table.remove(inode.get_key());
            end
        end
    end
end