function [S,K]=SSAmod(x,parameters)

% Defining the parameter variables
k1=parameters(1); k2=parameters(2); k3=parameters(3);
k4=parameters(4); kg=parameters(5); kp=parameters(6);
kc=parameters(7);

% Stoichiometery Matrix
%[glucagon glucose insulin]
S=[0 -1  1; %glucose -> insulin
   0  1 -1; %insulin -> glucose
   1 -1  0; %glucose -> glucagon
  -1  1  0; %glucagon -> glucose
  -1  0  0; %glucagon degrades
   0  0 -1; %insulin degrades
   0 -1  0]; %glucose consumed

    
% Propensity Function
W0=[0 0 0 0 0 0 0]; % initial rates
W1=[0 k1 0; %glucose -> insulin
    0 0 k2; %insulin -> glucose
    0 k3 0; %glucose -> glucagon
    k4 0 0; %glucagon -> glucose
    kp 0 0; %glucagon degrades
    0 0 kg; %insulin degrades
    0 kc 0]; %glucose consumed

P=W0+W1*x;
K=P(:,1);
end