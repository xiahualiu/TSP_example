% MECH 7011 Class Project 1
% 
% member.m
% This is node of the family structure, it includes parents and offsprings
% Implemented with linked list (stack - LIFO) 
%
% Author: Xiahua Liu

classdef member < handle
  properties (SetAccess = public)
    item; % Item is a ordered list of the cities.
    next; % Point to the next paht object
  end
  
  methods
    function obj=member(ordered_list)
      obj.item=ordered_list; 
      obj.next=[]; % No next null pointer
    end
  end
end