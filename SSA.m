function [y,t]=SSA(tf,x0,parameters)
%y=zeros(3,1000);
y=x0;
t(1)=0;
i=1;
    while t<tf 
          
    %Calculates propensities and Stoichiometery for current state
    [S,P]=SSAmod(y(:,i),parameters);
    Sr=rot90(S); %rotates matrix S so matrix length agrees
    Srf=flip(Sr,1); %flips matrix to have variables in correct vertical order
    %time to next event
    s=sum(P); %sum of propensity function
    tau=-log(1-rand)/s;
    t(i+1)=t(i)+tau;
    %choosing the reaction that occurs based on probability
    pop=[P(1),P(2),P(3),P(4),P(5),P(6),P(7)];
    weight=[P(1)/s,P(2)/s,P(3)/s,P(4)/s,P(5)/s,P(6)/s,P(7)/s];
    weight(isnan(weight))=0;
    u=randsample(pop,1,true,weight); %gives propensity based on its probability
    n=find(pop==u,1,'first');%position of selected propensity
    y(:,i+1)=y(:,i)+Srf(:,n); %updates protein count for each spieces
          i=1+i; %Increases counter
%disp(t)
%disp(y)

%step=i
    end
step=i; %shows how many iterations occured
t;
end