clear all;
%close all;


%% S = importdata("kprobssimkappa1exp.mat");
%% simres1exp = S.simres1;
%% simres2exp = S.simres2;
%% simres3exp = S.simres3;


S = importdata("kprobstheorykappa1.mat");
theoryres1 = round(S.theoryres1,2);
theoryres2 = round(S.theoryres2,2);
theoryres3 = round(S.theoryres3,2);
%theoryres4 = S.theoryres4;

S = importdata("kprobssim90kappa1.mat");
simres190 = S.simres1;
simres290 = S.simres2;
simres390 = S.simres3;
%simres490 = S.simres4;

%% S = importdata("kprobssim70.mat");
%% simres170 = S.simres1;
%% simres270 = S.simres2;
%% simres370 = S.simres3;


%% S = importdata("kprobssim60.mat");
%% simres160 = S.simres1;
%% simres260 = S.simres2;
%% simres360 = S.simres3;


S = importdata("kprobssim40kappa1.mat");
simres140 = S.simres1;
simres240 = S.simres2;
simres340 = S.simres3;
%simres440 = S.simres4;

%% S = importdata("kprobssim30kappa1.mat");
%% simres130 = S.simres1;
%% simres230 = S.simres2;
%% simres330 = S.simres3;
%simres430 = S.simres4;


tau = -7:0.5:20;
simtau=-7:1:20;


figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');


plot(tau,theoryres1,'-*','color',"#0072BD",'linewidth',2)
plot(tau,theoryres2,'-s','color',"#D95319",'linewidth',2)
plot(tau,theoryres3,'-^','color',"#EDB120",'linewidth',2)
%plot(tau,theoryres4,'color',"blue",'linewidth',2)

%% plot(simtau,simres1exp,'-*','color',"#0072BD",'linewidth',2)
%% plot(simtau,simres2exp,'-s','color',"#D95319",'linewidth',2)
%% plot(simtau,simres3exp,'-^','color',"#EDB120",'linewidth',2)

%plot(simtau,simres190,'--','color',"black",'linewidth',1)
%plot(simtau,simres290,'--','color',"black",'linewidth',1)
%plot(simtau,simres390,'--','color',"black",'linewidth',1)
%plot(simtau,simres490,'--','color',"black",'linewidth',1)

%% plot(simtau,simres170,'--','color',"black",'linewidth',1)
%% plot(simtau,simres270,'--','color',"black",'linewidth',1)
%% plot(simtau,simres370,'--','color',"black",'linewidth',1)

%% plot(simtau,simres160,'--','color',"black",'linewidth',1)
%% plot(simtau,simres260,'--','color',"black",'linewidth',1)
%% plot(simtau,simres360,'--','color',"black",'linewidth',1)

%plot(simtau,simres470,'--','color',"black",'linewidth',1)


%plot(simtau,simres140,'--','color',"black",'linewidth',1)
%plot(simtau,simres240,'--','color',"black",'linewidth',1)
%plot(simtau,simres340,'--','color',"black",'linewidth',1)

%plot(simtau,simres130,'--','color',"black",'linewidth',1)
%plot(simtau,simres230,'--','color',"black",'linewidth',1)
%plot(simtau,simres330,'--','color',"black",'linewidth',1)

%plot(simtau,simres440,'--','color',"black",'linewidth',1)


fill([-10,fliplr(-10)],[1,fliplr(1)],[0 0 0],'FaceAlpha',0.3,'EdgeColor','none');
fill([-10,fliplr(-10)],[1,fliplr(1)],[1 1 1],'FaceAlpha',0.3,'EdgeColor','none');

fill([simtau,fliplr(simtau)],[simres140',fliplr(simres190')],[0 0.4470 0.7410],'FaceAlpha',0.3,'EdgeColor','none');

fill([simtau,fliplr(simtau)],[simres240',fliplr(simres290')],[0.8500 0.3250 0.0980],'FaceAlpha',0.3,'EdgeColor','none');

fill([simtau,fliplr(simtau)],[simres340',fliplr(simres390')],[0.9290 0.6940 0.1250],'FaceAlpha',0.3,'EdgeColor','none');



% Create legend
legend('Analysis; $k=1$  \hspace{0.1cm} (defective exponential','Analysis; $k=2$ \hspace{0.1cm} shadowing in the planar model)','Analysis; $k=3$ \hspace{0.1cm}','Simulated values (mixed log-normal shadowing','\hspace{2.65cm} in the spherical model)','Interpreter','latex',...
    'FontSize',14,BackgroundAlpha=.3)

xlabel('$\tau$(dB)','FontSize',14,'Interpreter','latex')
ylabel('$\mathcal{P}^{(k)}(\tau)$','FontSize',14,'Interpreter','latex')
%title('$\tilde{\kappa}=3/b_{\epsilon}, \epsilon \in \{90,80,70,60,50,40\}^{\circ}$','FontSize',14,'Interpreter','latex')
grid on
axis([[-7,20],[0,1]])

title('$\tilde{\kappa}\rho_{\epsilon}= 1$','FontSize',14,'Interpreter','latex')


% Create textarrow
annotation(figure1,'textarrow',[0.416228070175437 0.368421052631579],...
    [0.540000000000001 0.48],'String',{'$\epsilon=40^{\circ}$'},...
    'Interpreter','latex');

% Create textbox
annotation(figure1,'textbox',...
    [0.333834586466167 0.410428570447015 0.10438596665584 0.0711111120926708],...
    'String',{'$90^{\circ}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FitBoxToText','off');
latex2axes(figure1,"Times New Roman",14,"normal")
