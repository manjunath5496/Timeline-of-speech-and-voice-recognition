% Problem set 6 Problem 1

clear all
close all

nrep=1000;

% True x90 value, a=5:
x90true = expinv(0.9,5)

% Method 1: Pick the 9th value of the 10 ranked values

samples1=exprnd(5,nrep,10);
sorted=sort(samples1,2);
x90_1=sorted(:,9);

mu1=mean(x90_1)
var1=var(x90_1)

% Method 2: Take the mean of the sample and use that as a to compute
% x90=Finv(0.9)

samples2=exprnd(5,nrep,10);
means=mean(samples2,2);
x90_2 = expinv(0.9,means);

mu2=mean(x90_2)
var2=var(x90_2)

figure
subplot(2,2,1), hist(x90_1)
subplot(2,2,2), normplot(x90_1)
subplot(2,2,3), hist(x90_2)
subplot(2,2,4), normplot(x90_2)

% The second method is better.  This makes sense because you're using all
% the data, not just one data point per set.