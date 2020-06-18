% Problem 3
function main
a= [.2  .5]
b=3*ones(1,2)
x=subfunc(a.*b)
return
function x=subfunc(a)
x=sin(2*pi*a);
return
