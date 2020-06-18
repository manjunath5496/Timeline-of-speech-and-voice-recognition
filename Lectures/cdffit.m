function cdffit(data,ndist,p1,p2)
% Program to compare sample and specified CDFs
%
dmin=min(data);
dmax=max(data);
figure
cdfplot(data)
hold on
x=[0.9*dmin:(dmax-dmin)/100:1.1*dmax];
if(ndist==1), plot(x,unifcdf(x,p1,p2),'r'),  end
if(ndist==2), plot(x,expcdf(x,p1),'r'),  end
if(ndist==3), plot(x,normcdf(x,p1,p2),'r'),  end
if(ndist==4), plot(x,logncdf(x,p1,p2),'r'),  end
return
