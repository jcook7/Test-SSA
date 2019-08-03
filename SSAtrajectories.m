function [Iavg,Savg,Gavg,time]=SSAtrajectories(tf,x0,parameters,runs)
time=linspace(0,tf,1000);
n=length(time);

    for j=1:runs
    [y,t]=SSA(tf,x0,parameters);
    yinsulin=y(3,:); %insulin trajectory
    yglucose=y(2,:); %glucose trajectory
    yglucagon=y(1,:); %glucagon trajectory

        for i=1:n
        I_less=t(t <= time(i));
        Im=max(I_less);% finds nearest value to time interval insulin
        Ip=find(t==Im); %finds position of time in insulin matrix
        Iv=yinsulin(Ip);% gives value of insulin matrix
        yinsulinN(j,i)=Iv;
    
        S_less=t(t <= time(i));
        Sm=max(S_less);% finds nearest value to time interval glucose
        Sp=find(t == Sm); %finds position of time in glucose matrix 
        Sv=yglucose(Sp); %gives value of glucose matrix
        yglucoseN(j,i)=Sv;
  
        G_less=t(t <= time(i));
        Gm=max(G_less);% finds nearest value to time interval glucagon
        Gp=find(t == Gm); %finds position of time in glucagon matrix
        Gv=yglucagon(Gp); %gives value of glucagon matrix
        yglucagonN(j,i)=Gv;
        end
        
    end
     
        Iavg=sum(yinsulinN,1)./runs;
        Savg=sum(yglucoseN,1)./runs;
        Gavg=sum(yglucagonN,1)./runs;
        
end

