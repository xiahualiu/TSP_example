classdef edges < handle
    properties (SetAccess=private)
        list;
    end

    methods
        function obj=edges(obj)
            obj.list=[];
        end

        function insert(obj, new_edge)
            index = find(obj.list == new_edge);
            if isempty(index) % If the edge exist, we do nothing
                obj.list = [obj.list, new_edge]; 
            end
        end

        function delete(obj, old_edge)
            index = find(obj.list == old_edge);
            if isempty(index)
                error('You are deleting a non existing edge!')
            else
                obj.list(index)=[]; % Delete the old_edge
            end
        end

        function result = get(obj)
            result=obj.list;
        end
    end
end