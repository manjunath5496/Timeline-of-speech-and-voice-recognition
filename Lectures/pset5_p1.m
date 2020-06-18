% Problem Set 5
% Problem 1
clear all
close all

nrep=1000000;
emu=4;
esigma=.8;
qmu=10;
qsigma=1;

% create a matrix of random e's
emat=normrnd(emu,esigma,nrep,9);
% create the Q matrix
Qmat = zeros(nrep,10);
Qmat(:,1) = normrnd(qmu,qsigma,nrep,1);

for i=2:10
    Qmat(:,i) = 0.6*Qmat(:,i-1)+emat(:,i-1);
end

% to get the correlation, need mean of (Q2-Q2bar)*(Q3-Q3bar) divided by
% sqrt [var(Q2)*var(Q3)]

Q2bar=mean(Qmat(:,2));
Q3bar=mean(Qmat(:,3));
numerator = mean((Qmat(:,2)-Q2bar).*(Qmat(:,3)-Q3bar));

denominator = sqrt(var(Qmat(:,2))*var(Qmat(:,3)));

correl = numerator/denominator
covariance = numerator

vect = Qmat(:,2)>12 & Qmat(:,3)>12;
jointprob = sum(vect)/nrep

plot(1:10,Qmat(5,:),'-*')
xlabel('Time')
ylabel('Streamflow')
title('Sample Streamflow vs. Time')

%  One set of results:
%correl =

%    0.6007


% covariance =

  %  0.6012


% jointprob =

  %  0.0057