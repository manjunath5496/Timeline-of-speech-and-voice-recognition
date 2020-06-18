% Problem Set 6 Problem 2
clear all
close all

% The Bivariate Normal Distribution

rho=-.5;
sigmax=1;
sigmay=1;
muxy=[0 0];

C=[sigmax^2, rho*sigmax*sigmay; rho*sigmax*sigmay,sigmay^2];

values = mvnrnd(muxy,C,100);

plot(values(:,1),values(:,2),'*')