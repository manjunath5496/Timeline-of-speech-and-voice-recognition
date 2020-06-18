% Problem Set 5 
% Problem 2
clear all
close all

nrep=1000;

mat=exprnd(5,nrep,64);

m1=mat(:,1);
m4=sum(mat(:,1:4),2)/4;
m16=sum(mat(:,1:16),2)/16;
m64=sum(mat(:,1:64),2)/64;

figure
subplot(2,2,1), hist(m1)
subplot(2,2,2), hist(m4)
subplot(2,2,3), hist(m16)
subplot(2,2,4), hist(m64)


figure
normplot(m1)
hold
normplot(m4)
normplot(m16)
normplot(m64)

legend('N=1','N=4','N=16','N=32')