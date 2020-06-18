% Problem 4
function problem4
load land.dat
for i=1:4
    area(i)=2*sum(sum(land==i))
end
