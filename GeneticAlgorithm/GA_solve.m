% MECH 7011 Class Project 115
% 
% test.m
% This script does the intialization job and handles the input sequence.
%
% Author: Xiahua Liu

clear all
close all
clc

global population;
global N;
global loop_times; % The program stop at loop_times gen. 

N=input ('Please pick an integer in [1-10]!\n');

population=N*2;
loop_times=40; % squared loop time limit

tic
TSP(N);
toc