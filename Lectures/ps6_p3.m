% Problem Set 6 Problem 3

clear all
close all

load arsenicdata.txt

N=[4 8 32 64 128];
popmu=mean(arsenicdata);
pops=std(arsenicdata);

for i=1:5
    number=N(i);
    index = randperm(length(arsenicdata));
    sample=arsenicdata(index(1:number));
    mu(i)=mean(sample);
    s(i)=std(sample);
end

mudiff=abs(popmu-mu);
sdiff=abs(pops-s);

figure
plot(N,mudiff,'*')
figure
plot(N,sdiff,'*')
    