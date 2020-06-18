% 1.017/1.010 Problem Set 1 Solution 
% Problem 1

close all
clear all

load income.txt         % per capita income in 1996 dollars
load energy.txt         % per capita energy use in mil Btu
load fed_aid.txt        % per capita federal aid in 1996 dollars
load unemployment.txt   % percent unemployment  

mean(income)
median(income)
var(income)

mean(energy)
median(energy)
var(energy)

mean(fed_aid)
median(fed_aid)
var(fed_aid)

mean(unemployment)
median(unemployment)
var(unemployment)

% plot histograms and cdf's for each

figure
hist(income,6)
xlabel('Average Per Capita Income in 1996 USD')
ylabel('Number of States in Range')
title('Histogram of Per Capita Income for the 50 States and DC')

figure
cdfplot(income)
xlabel('Average Per Capita Income in 1996 USD')
ylabel('F(income)')
title('Cumulative Distribution Function of Per Capita Income for the 50 States and DC')

figure 
hist(energy,6)
xlabel('Per Capita Energy Use in mil Btu')
ylabel('Number of States in Range')
title('Histogram of Per Capita Energy Use for the 50 States and DC')

figure
cdfplot(energy)
xlabel('Per Capita Energy Use in mil Btu')
ylabel('F(energy)')
title('Cumulative Distribution Function of Per Capita Energy Use for the 50 States and DC')

figure
hist(fed_aid,5)
xlabel('Per Capita Federal Aid in 1996 USD')
ylabel('Number of States in Range')
title('Histogram of Per Capita Federal Aid for the 50 States and DC')

figure
cdfplot(fed_aid)
xlabel('Per Capita Federal Aid in 1996 USD')
ylabel('F(Aid)')
title('Cumulative Distribution Function of Per Capita Federal Aid for the 50 States and DC')

figure 
hist(unemployment,6)
xlabel('Unemployment Rate [%]')
title('Histogram of Unemployment Rate for the 50 States and DC')

figure
cdfplot(unemployment)
xlabel('Unemployment Rate [%]')
ylabel('F(Unemployment)')
title('Cumulative Distribution Function of Unemployment Rate for the 50 States and DC')

figure
plot(income,energy,'*')
title('Per Capita Energy Use vs Income')
xlabel('Income [1996 USD]')
ylabel('Energy [mil BTU]')

figure
plot(income,fed_aid,'o')
title('Per Capita Federal Aid vs Income')
xlabel('Income [1996 USD]')
ylabel('Federal Aid [1996 USD]')

figure
plot(income,unemployment,'x')
title('Unemployment Rate vs Per Capita Income')
xlabel('Income [1996 USD]')
ylabel('Unemployment Rate [%]')