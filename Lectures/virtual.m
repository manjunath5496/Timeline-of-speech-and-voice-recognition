% Program to simulate simple probability experiments
%
% Simulate nrep tosses of two dice
nrep=100000
% result of toss (2 random numbers per toss/replicate, one for each die)
toss=6*rand(nrep,2);
seven=0;
% compute number of replicates that give a total of seven
% (ceil(toss(:,1))+ceil(toss(:,2)))==7) is 1 if true and 0 if false
seven=sum((ceil(toss(:,1))+ceil(toss(:,2)))==7)
p_freq_seven=seven/nrep
p_conceptual_seven=6/36
%
% Simulate nrep darts thrown at random into circle inscribed in square region
% coordinates of darts
% region spans -1 to +1 in each coordinate
coord=2*rand(nrep,2) - 1;
circle=0;
% replicate loop (nrep total outcomes)
% compute number of replicates that give a total of seven
% (coord(j,1).^2 + coord(j,2).^2 <=1) is 1 if true and 0 if false
circle=sum(coord(:,1).^2 + coord(:,2).^2 <=1)
p_freq_circle=circle/nrep
p_conceptual_circle=pi/4
pi_estimate=4*p_freq_circle