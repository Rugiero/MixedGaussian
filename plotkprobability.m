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
%simres470 = S.simres4;

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



%% simdist1 = S.dist1;
%% simdist2 = S.dist2;
%% simdist3 = S.dist3;
%% [f1,x1] = ecdf(simdist1);
%% [f2,x2] = ecdf(simdist2);
%% [f3,x3] = ecdf(simdist3);

%% plot(10*log10(x1),1-f1,'--','color','#0072BD','linewidth',2)
%% plot(10*log10(x2),1-f2,'--','color','#D95319','linewidth',2)
%% plot(10*log10(x3),1-f3,'--', 'color','#EDB120','linewidth',2)

tau = linspace(-8,4,25);
simtau=linspace(-8,4,13);


figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');


plot(tau,theoryres1,'-*','color',"#0072BD",'linewidth',2)
plot(tau,theoryres2,'-s','color',"#D95319",'linewidth',2)
plot(tau,theoryres3,'-^','color',"#EDB120",'linewidth',2)
%plot(tau,theoryres4,'color',"blue",'linewidth',2)

%plot(simtau,simres1exp,'-*','color',"#0072BD",'linewidth',2)
%plot(simtau,simres2exp,'-s','color',"#D95319",'linewidth',2)
%plot(simtau,simres3exp,'-^','color',"#EDB120",'linewidth',2)

%plot(simtau,simres190,'--','color',"black",'linewidth',1)
%plot(simtau,simres290,'--','color',"black",'linewidth',1)
%plot(simtau,simres390,'--','color',"black",'linewidth',1)
%plot(simtau,simres490,'--','color',"black",'linewidth',1)

%plot(simtau,simres170,'--','color',"black",'linewidth',1)
%plot(simtau,simres270,'--','color',"black",'linewidth',1)
%plot(simtau,simres370,'--','color',"black",'linewidth',1)
%plot(simtau,simres470,'--','color',"black",'linewidth',1)


%plot(simtau,simres140,'--','color',"black",'linewidth',1)
%plot(simtau,simres240,'--','color',"black",'linewidth',1)
%plot(simtau,simres340,'--','color',"black",'linewidth',1)

%plot(simtau,simres130,'--','color',"black",'linewidth',1)
%plot(simtau,simres230,'--','color',"black",'linewidth',1)
%plot(simtau,simres330,'--','color',"black",'linewidth',1)

%plot(simtau,simres440,'--','color',"black",'linewidth',1)

fill([-10,fliplr(-10)],[1,fliplr(1)],[0 0 0],'FaceAlpha',0.3,'EdgeColor','flat');

fill([simtau,fliplr(simtau)],[simres140',fliplr(simres190')],[0 0.4470 0.7410],'FaceAlpha',0.3,'EdgeColor','flat');

fill([simtau,fliplr(simtau)],[simres240',fliplr(simres290')],[0.8500 0.3250 0.0980],'FaceAlpha',0.3,'EdgeColor','flat');

fill([simtau,fliplr(simtau)],[simres340',fliplr(simres390')],[0.9290 0.6940 0.1250],'FaceAlpha',0.3,'EdgeColor','flat');



% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.336499488529572 0.65060787302535 0.627438133302787 0.254824225740082],...
    'Interpreter','latex',...
    'FontSize',14,...
    'BackgroundAlpha',0.5);
legend('Theory; k=1 (exponential shadowing)','Theory; k=2 (exponential shadowing)','Theory; k=3 (exponential shadowing)','Range of the simulated values for $\{\epsilon\}$','Interpreter','latex',...
    'FontSize',14,BackgroundAlpha=.5)

xlabel('$\tau$(dB)','FontSize',14,'Interpreter','latex')
ylabel('$\mathcal{P}^{(k)}(\tau)$','FontSize',14,'Interpreter','latex')
%title('$\tilde{\kappa}=3/b_{\epsilon}, \epsilon \in \{90,80,70,60,50,40\}^{\circ}$','FontSize',14,'Interpreter','latex')
grid on
axis([[-8,4],[0,1]])

title('$\tilde{\kappa}\mathcal{B}_{\epsilon}= 1$','FontSize',14,'Interpreter','latex')

%% % Create text
%% text('Parent',axes1,'FontSize',14,'Interpreter','latex',...
%%     'String','$\epsilon=90^{\circ}$',...
%%     'Position',[-4.4841628959276 0.479452054794521 0]);

%% % Create text
%% text('Parent',axes1,'FontSize',14,'Interpreter','latex',...
%%     'String','$\epsilon=40^{\circ}$',...
%%     'Position',[-2.36651583710407 0.594520547945206 0]);
 latex2axes(figure1,"Times New Roman",14,"normal")

