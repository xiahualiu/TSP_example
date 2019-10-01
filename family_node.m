% MECH 7011 Class Project 1
% 
% family_node.m
% This is node of the family structure, it includes parents and offsprings
% Implemented with linked list (stack - LIFO) 
%
% Author: Xiahua Liu

classdef family < handle
  properties (SetAccess = private)
    individual;
    next; % Point to the next 
  end
  
  methods
    function obj=family(p1)
      obj.individual=p1;
      obj.next=[]; % No next null pointer
    end
  end
end