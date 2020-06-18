% 1.017 Problem Set 2
%-------------------------------------------------------------------------
% Problem 1 

% Combinatorially:
% with replacement: P(r,w,b)=(P 1,6 * P 1,4 *P 1,5)/ 15^3 = .0356
% without replacement: P(r,w,b)=(P 1,6 * P 1,4 *P 1,5)/ P 3,15 = .044

% Monte Carlo
    % with replacement:
clear all
    %generate an array of random numbers
totalnum=10000;    
picks=rand(totalnum,3);

for i=1:totalnum
    rwb(i)=picks(i,1)<.4&picks(i,2)>=.4&picks(i,2)<(2/3)&picks(i,3)>=(2/3);
end

prob1_rep=sum(rwb)/totalnum

% without replacement

for i=1:totalnum
    balls=[ones(1,6),2*ones(1,4),3*ones(1,5)];
    for j=1:3
        number=unidrnd(length(balls));
        draw(i,j)=balls(number);
        balls(number)=[];
    end
    rwb2(i)=draw(i,1)==1&draw(i,2)==2&draw(i,3)==3;
end    
prob1_norep=sum(rwb2)/totalnum
%---------------------------------------------------------------------
% Problem 2

% combinatorially:
%P(get water)=P(1,2,5 good)+P(3,4,5 good)-P(all good) (don't double count)
% P(water)=(0.7)63+(0.7)^3-(0.7)^5
probwater=(0.7)^3+(0.7)^3-(0.7)^5

% simulating:
clear all
totalnum=10000;
pfails=0.3;
pnofail=1-pfails;
randoms=rand(totalnum,5);
nofail=randoms<=pnofail;

% using vectors
a=nofail(:,1)==1&nofail(:,2)==1&nofail(:,5)==1;
b=nofail(:,3)==1&nofail(:,4)==1&nofail(:,5)==1;
c=nofail(:,1)==1&nofail(:,2)==1&nofail(:,5)==1&nofail(:,3)==1&nofail(:,4)==1;
probwater1=(sum(a)+sum(b)-sum(c))/totalnum

% using ifs
for i=1:totalnum
    if nofail(i,1)==1&nofail(i,2)==1&nofail(i,5)==1
        count(i)=1;
    elseif nofail(i,3)==1&nofail(i,4)==1&nofail(i,5)==1
        count(i)=1;
   else
        count(i)=0;
    end
end    
        
probwater2=sum(count)/totalnum

%----------------------------------------------------------------------
% problem 3
clear all
% combinatorics:

% total outcomes = C 5,52
% Tens: C 3,5 =10; Jacks: C 2,5 =10
prob1=10*10/(factorial(52)/factorial(5)/factorial(52-5))

totnum=100000;
pick=ceil(52*rand(totnum,5));

% don't pick the same card twice (w/o replacement)
% tens are 1-4, Jacks are 5-8 (random assignment)
% let's give 10's a point value of 1 and jacks a point value of 10.

cards=[ones(1,4),10*ones(1,4),zeros(1,44)];
for i=1:totnum
    addemup(i)=sum(cards(pick(i,:)));
end
howmany=addemup==23;
prob2=sum(howmany)/totnum

%-------------------------------------------------------------------------
% Problem 4

% Analytically:
% P(4)= (C4,8*C 1,12)/ C 5,20 = .0542
% P(4+)=P(4)+P(5)=.0542+ (C 5,8 / C 5,20)=.0578

clear all
totnum=10000;
% initialize a matrix of picks for each replicate
cracked=zeros(totnum,5);

for i=1:totnum
    bridgeset=[ones(1,8),2*ones(1,12)];
    for k=1:5
        pick=unidrnd(length(bridgeset));
        bridge=bridgeset(pick);
        cracked(i,k)=bridge==1;
        bridgeset(pick)=[];
    end
    fourcracks(i)=(sum(cracked(i,:)))==4;
    fourorfive(i)=(sum(cracked(i,:)))==4|(sum(cracked(i,:)))==5;
end

prob4cracked=sum(fourcracks)/totnum
prob4morecracked=sum(fourorfive)/totnum
%-----------------------------------------------------------------------
% Problem 5
clear all
close all

% first do it with combinatorial methods:
% P=1-(365/365)(364/365)(363/365)...(336/365) = .706
prob=1;
for i=1:30
    temp=(365-(i-1))/365;
    prob=prob*temp;
end

prob1=1-prob

% now let's simulate it:

nrep=1000;

for i=1:nrep
    bdays=unidrnd(365,1,30);
    for j=1:365
        howmany(j)=sum(bdays==j);
    end
        yes(i)=sum(howmany>1);
end
count=yes>0;
prob2=sum(count)/nrep

        