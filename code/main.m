% The main function of memorability prediction
% Load the data and set the parameter
% Obtain the result in terms of RC and R-value and predicted memorability scores
% Obtain the average results based on predicted results
clear;
clc;

%% Load data
load('.\data\train.mat');
load('.\data\y_train.mat');
load('.\data\test.mat');
load('.\data\y_test.mat');

%% Parameter setting
lamda=10;
alpha=10;
beta=1;

%% Optimization
[A,B]=optimization(train,y_train,lamda,alpha,beta);

%% Prediction&Evaluate
y_pre=test*A*B;
y_norm=norms(y_pre,y_test);
y_rank=rank(y_pre);
y_truth=rank(y_test);
rc_value=rc(y_rank,y_truth);
r_value=rvalue(y_pre,y_test);

%% The average results based on predicted results
[t20,t100,t200,b200,b100,b20]=tb(y_rank,y_test);

