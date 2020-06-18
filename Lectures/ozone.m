% Problem Set 3 Problem 2
clear all 
close all

% Ozone Problem
nrep=100000;
randoms=rand(nrep,31);
exceed=randoms<0.3;
tot_d_over=sum(exceed,2);

for i=1:32
    count(i)=sum(tot_d_over==(i-1));
end

% Plot the PMF
figure
stem(0:31,count/nrep)
title('PMF for the Number of Days in August Exceeding Ozone Standard')
xlabel('Number of Days in August Exceeding Standard')
ylabel('Frequency')

% Plot the CDF
figure
cdfplot(tot_d_over)
title('CDF for the Number of Days in August Exceeding Ozone Standard')
xlabel('Number of Days in August Exceeding Standard')
ylabel('F(x)')