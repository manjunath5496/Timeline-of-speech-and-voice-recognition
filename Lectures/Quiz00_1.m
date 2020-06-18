% Solutions for Quiz 1, Fall 2000
% Put individual scripts/functions into separate files
% before running programs

% Quiz 1, Problem 1
a=[ 4  3  1 ]
b=[ -3 2  7 ]
test=a.*b>6
ftest=find(a.*b>6)

% Quiz 1, Problem 2
nmax=20
n(1)=1
n(2)=1
for i=3:nmax
   n(i)=n(i-1)+n(i-2);
end
n

% Quiz 1, Problem 3
function plotsp
% define range of p values plotted
% call sp to get saturation values
p=0:150  plot(p,sp(p))  
axis([0,150,0,1.1])
xlabel('p')
ylabel('s')
return
function s=sp(p)
% specify s values using arrays with indices obtained
% from logical comparisons
s=zeros(1,length(p))
s(p<10)=1;
s(((10<=p)&(p<100)))=1+0.01*...
   (10-p(((10<=p)&(p<100))));
s(p>=100)=0.1;
return

% Quiz 1, Problem 4
function srand(n)
x=2*pi*rand(n,1);
y=sin(x);
hist(y)
return

% Quiz 1, Problem 5
function main(b)
a=b+4;
x=subfunc(a)
return
function x=subfunc(a)
x=a.^2+1;
return

% Quiz 1, Problem 6
function answers=check
load rain1.dat
load rain2.dat
% define long and short arrays
if(length(rain1)<=length(rain2))
   short=rain1;
   long=rain2;
else
   short=rain2;
   long=rain1;
end
% fill extended with values from long
extended=long;
% write over extended entries from 1: length(short)
% with values from short
extended(1:length(short))=short(1:length(short))
answers=[min(short),max(short),min(long),...
      max(long),min(extended),max(extended)];
return

% Quiz 1, Problem 7
function x=wdist(P1,K12,K23,Q2,Q3)
% set up coefficient matrix A for set of 4 eqs in 4 unknowns
A=[1,0,K12,0;...
      -1,1,0,K23;...
      0,0,1,-1;...
      0,0,0,1]
% Put known constants in right-hand side vector b
b=[P1;0;Q2;Q3]
% Solve equation set
x=A\b
return
