% MECH 7011 Class Project 1
% 
% randd.m
% This random function produce adjustable random value
%
% Author: Xiahua Liu

function result=randd(n,sigma) % produce integer < n
  result=0;
  result=mod(abs(round(sigma/10*randn())),n)+1;
end
