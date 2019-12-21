% MECH 7011 Class Project 1
% 
% family.m
% This is the family structure, wrapping the path structure up,
% The stack includes parents and offsprings and can grow bigger or shrink.

classdef family < handle
  properties (SetAccess = private)
    member;
    length;
  end
  
  methods
    function obj=family(~) % Initialize family
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
    
    function shuffle(obj) % Shuffle members in a family
      vec=randperm(obj.length);
      temp=obj.member;
      for i=1:obj.length
        temp(i)=obj.member(vec(i));
      end
      obj.member=temp;
    end
    
    function list=all(obj)
      list=obj.member;
    end
  end
end
