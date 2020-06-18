% Quiz 2 solution set
% Extract following functions and run in separate files
% Problem 1
function problem1
y = [2.72    1.44   24.28    6.96    6.40   16.30   11.72 ...
     8.63    2.94   10.52    8.48    1.63    12.77    1.50 0.14]
cdfplot(y)
return
% Problem 3
function problem3
nrep=10000;
y=1+rand(1,nrep);
z=y./(y+1);
close all
figure 
hist(z)
figure
cdfplot(z)
end
return
% Problem 5
function problem5
nrep=10000;
y=exprnd(5,100,nrep);
z=max(y);
close all
figure
hist(z,50)
figure
cdfplot(z)
return
