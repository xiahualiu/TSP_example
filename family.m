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
    member;
    length;
  end
  
  methods
    function obj=family(obj) % Initialize family
      obj.member=[]; % This is null pointer
      obj.length=0;
    end
    
    function push(obj,p1) % Push a path object to the stack
      obj.member=[obj.member,p1];
      obj.length=obj.length+1;
    end
    
    function px=pop(obj) % Pop up a path object on the stack
      px=obj.member(1);
      obj.member(1)=[]; % Delete the first member
      obj.length=obj.length-1;
    end
    
    function list=all(obj)
      list=obj.member;
    end
  end
end
