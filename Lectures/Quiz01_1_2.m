% Problem 2
function problem2
a=[1 2];
for i=1:3:9
    a=2.*a-3;
    if(a<-4)
        flag=1;
    else
        flag=0;
    end
    result=[a, flag]
end
return
