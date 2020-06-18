% Problem Set 6 Problem 4   

clear all
close all

load p4_sample.txt
data=p4_sample;

mu=mean(data)
s=std(data)

N=length(data);

% 90% confidence interval
zl=norminv(.05);
zu=norminv(.95);

lowerbound90=-(zu*s/sqrt(N)-mu)     %   1.4836
upperbound90=-(zl*s/sqrt(N)-mu)     %   3.0907

% 95% confidence interval
zl=norminv(.025);
zu=norminv(.975);

lowerbound95=-(zu*s/sqrt(N)-mu)     %   1.3297
upperbound95=-(zl*s/sqrt(N)-mu)     %   3.2446

% 99% confidence interval
zl=norminv(.005);
zu=norminv(.995);

lowerbound99=-(zu*s/sqrt(N)-mu)     %   1.0289
upperbound99=-(zl*s/sqrt(N)-mu)     %   3.5454