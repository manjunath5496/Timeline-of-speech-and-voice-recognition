function balls
% function to simulate sampling from a set of 20 colored balls
% 8 red, 3 white, 9 blue
% sample 3 balls without replacement
nrep=10000
nred=zeros(nrep,1);
nwhite=zeros(nrep,1);
nblue=zeros(nrep,1);
for k=1:nrep
    % construct population of 20 balls
    pop=[ones(1,8),2*ones(1,3), 3*ones(1,9)];
    % draw 3 balls w/o replacement
    for j=1:3
        % pick ball at random
        ball_id=unidrnd(length(pop));
        % tally experimental outcomes
        nred(k)=nred(k)+(pop(ball_id)==1);
        nwhite(k)=nwhite(k)+(pop(ball_id)==2);
        nblue(k)=nblue(k)+(pop(ball_id)==3);
        % remove selected ball from population
        pop(ball_id)=[];
    end
    % test for events
end
all_red=sum(nred==3);
two_red_one_white=(sum((nred==2)&(nwhite==1)));
none_white=sum(nwhite==0);
one_each=sum((nred==1)&(nwhite==1)&(nblue==1));
% compute event probabilities
% check with combinatorial formulas
p_all_red=all_red/nrep
check_all_red=nchoosek(8,3)/nchoosek(20,3)
p_atleast_1_white=1-(none_white)/nrep
check_atleast_1_white=1-nchoosek(17,3)/nchoosek(20,3)
p_two_red_one_white=two_red_one_white/nrep
check_two_red_one_white=nchoosek(8,2)*nchoosek(3,1)/nchoosek(20,3)
p_one_each=one_each/nrep     
check_one_each=nchoosek(8,1)*nchoosek(3,1)*nchoosek(9,1)/nchoosek(20,3)
return