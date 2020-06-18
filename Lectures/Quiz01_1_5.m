% Problem 5
function problem5
load income.dat
assets(1)=20000.
for i=1:24
    assets(i+1)=assets(i)+income(i)-10000+.004*assets(i)
end
close all
figure
subplot(2,1,1)
bar(0.5:23.5,income,1)
subplot(2,1,2)
plot(0:24,assets)
return