% MECH 7011 Class Project 115
% 
% test.m
% This script does the intialization job and handles the input sequence.
%1
% Author: Xiahua Liu


clear all
close all
clc

global population;

population=10;

N=input ('Please pick an integer in [1-10]!\n');

TSP(N);