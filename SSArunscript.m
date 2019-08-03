%% Runnig SSA
clc,clear
tf=180; %final time
% par1=parameter fitting with everything in mmol     
% par2=parameter fitting with raw data
par1=[0.000004311403584  96.433289207665339   0.000017682899171  92.455548209022353  0  0.000023703553218  29.149803396517427];
par2=[0.085479274306235   3.861799655105032   0.001147249102353   0.000742627244747 0  0.000000000010320 0.018652157890961];
x0 = [0;200;0;]; %intial amount of molecule in order [glucagon;glucose;insulin]
runs=100; %Numbers of SSA projections made
[Iavg,Savg,Gavg,time]=SSAtrajectories(tf,x0,par2,runs);
figure(1)
subplot(3,1,1)
plot(time,Gavg,'g')%Average Glucagon
title('Glucagon'); xlabel('time'); ylabel('Glucagon')
subplot(3,1,2)
plot(time,Savg,'r')%Average Glucose
title('Glucose'); xlabel('time');  ylabel('Glucose')
subplot(3,1,3)
plot(time,Iavg,'b');%Average Insulin
title('Insulin'); xlabel('time');  ylabel('Insulin')
%%
[y,t]=SSA(tf,x0,par2); %single run
figure(2)
plot(t,y(1,:),'g',t,y(2,:),'r',t,y(3,:),'b');%Single SSA plot
title('Single run SSA Trajectory')
legend('glucagon (mmol)','glucose (mmol)','insulin (mmol)')

