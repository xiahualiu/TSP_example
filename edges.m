% MECH 7011 Class Project 1
% 
% edges.m
% Edge is a special object that support non repeated insertion and delete.
%
% Author: Xiahua Liu


classdef edges
    properties (SetAccess=private)
        list;
    end

    methods
        function obj=edges(~)
            obj.list=[];
        end

        function n_obj=insert(obj, new_edge)
            index = find(obj.list == new_edge,1);
            if isempty(index) % If the edge exist, we do nothing
                obj.list = [obj.list, new_edge]; 
            end
            n_obj=obj;
        end

        function n_obj=delete(obj, old_edge)
            index = find(obj.list == old_edge);
            if isempty(index)
              % Do nothing if key is not in the vector
            else
                obj.list(index)=[]; % Delete the old_edge
            end
            n_obj=obj;
        end

        function result = get(obj)
            result=obj.list;
        end
    end
end