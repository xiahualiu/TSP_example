% MECH 7011 Class Project 1
% 
% family.m
% This is the family structure, wrapping the family_node up,
% The stack includes parents and offsprings and can grow.
% Implemented over linked list (stack - LIFO) 
%
% Author: Xiahua Liu

classdef family
  properties (SetAccess = private)
    ptr=[];
    length=0;
  end
  
  methods
    function obj=family(n1)
      obj.ptr=n1;
      n1.next=[];
    end
    
    function push(n1)
      n1.next=ptr;
      ptr=n1;
    end
  end
end
