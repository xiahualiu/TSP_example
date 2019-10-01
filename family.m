% MECH 7011 Class Project 1
% 
% family.m
% This is the family structure, wrapping the path structure up,
% The stack includes parents and offsprings and can grow bigger or shrink.
% Implemented over linked list (stack - LIFO) 
%
% Author: Xiahua Liu

classdef family < handle
  properties (SetAccess = private)
    ptr;  % Point to the stack top all the time
    length;
  end
  
  methods
    function obj=family() % Initialize family
      obj.ptr=['null']; % This is null pointer
      obj.length=0;
    end
    
    function push(obj,p1) % Push a path object to the stack
      p1.next=obj.ptr;
      obj.ptr=p1;
      obj.length = obj.length + 1;
    end
    
    function member=pop(obj) % Pop up a path object on the stack
      member=obj.ptr;
      obj.ptr=ptr.next;
      obj.length = obj.length - 1;
    end
  end
end
