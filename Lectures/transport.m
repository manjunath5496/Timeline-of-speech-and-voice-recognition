% Pset 3 Question 1:

clear all
% Probability cargo transported by each method:
p_land=.5;
p_sea=.2;
p_air=.3;
% out of land transportation:
p_land_highway=.6;
p_land_rail=.4;
% total probabilities for land transpo
p_highway=p_land*p_land_highway;
p_rail=p_land*p_land_rail;
% probability of damaged cargo
damage_highway=.12;
damage_rail=.03;
damage_sea=.05;
damage_air=.02;

% what percentage of cargo is undamaged?
% if damaged, what is probablilty shipped by each method (land, sea, air)
nrep=100000;
damaged=zeros(nrep,2);
for i=1:nrep
    shipment=rand(1,1);
    if shipment<p_highway
        cargo=rand(1,1);
        damaged(i,1)=cargo<damage_highway;
        damaged(i,2)=1;      % 1 means shipped by land
    elseif shipment>=p_highway&shipment<(p_highway+p_rail)
        cargo=rand(1,1);
        damaged(i,1)=cargo<damage_rail;
        damaged(i,2)=1;      % 1 means shipped by land
    elseif shipment>=(p_highway+p_rail)&shipment<(p_highway+p_rail+p_sea)
        cargo=rand(1,1);
        damaged(i,1)=cargo<damage_sea;
        damaged(i,2)=2;      % 2 means shipped by sea
    elseif shipment>=(p_highway+p_rail+p_sea)
        cargo=rand(1,1);
        damaged(i,1)=cargo<damage_air;
        damaged(i,2)=3;      % 3 means shipped by air
    end 
end

p_undamaged=1-sum(damaged(:,1))/nrep

% numbers that are both damaged and by each transportation mode:

d_land=damaged(:,1)==1&damaged(:,2)==1;
d_sea=damaged(:,1)==1&damaged(:,2)==2;
d_air=damaged(:,1)==1&damaged(:,2)==3;

p_damaged_land=sum(d_land)/sum(damaged(:,1))
p_damaged_sea=sum(d_sea)/sum(damaged(:,1))
p_damaged_air=sum(d_air)/sum(damaged(:,1))


