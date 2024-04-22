% main

clear
clc

%% controling paramters of the GA algortihm

Problem.obj = @Sphere;
Problem.nVar = 20;

M = 10; % number of chromosomes (cadinate solutions)
N = Problem.nVar;  % number of genes (variables)
MaxGen = 100;
Pc = 0.5;
Pm = 0.01;
Er = 0.5;

[BestChrom]  = genetic_algo (M , N, MaxGen , Pc, Pm , Er , Problem.obj)

BestChrom

