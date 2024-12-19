clear all;
%close all;



%% S = importdata("kprobssimexp.mat");
%% simres1exp = S.simres1;
%% simres2exp = S.simres2;
%% simres3exp = S.simres3;

S = importdata("kprobstheoryout.mat");
theoryres1 = round(S.theoryres1,2);
theoryres2 = round(S.theoryres2,2);
theoryres3 = round(S.theoryres3,2);
%theoryres4 = round(S.theoryres4,2);

S = importdata("kprobssim90out.mat");
simres190 = S.simres1;
simres290 = S.simres2;
simres390 = S.simres3;
%simres490 = S.simres4;

%% S = importdata("kprobssim70.mat");
%% simres170 = S.simres1;
%% simres270 = S.simres2;
%% simres370 = S.simres3;
%%simres470 = S.simres4;

%% S = importdata("kprobssim60.mat");
%% simres160 = S.simres1;
%% simres260 = S.simres2;
%% simres360 = S.simres3;
%%simres470 = S.simres4;


S = importdata("kprobssim40out.mat");
simres140 = S.simres1;
simres240 = S.simres2;
simres340 = S.simres3;
%simres440 = S.simres4;

%% S = importdata("kprobssim30.mat");
%% simres130 = S.simres1;
%% simres230 = S.simres2;
%% simres330 = S.simres3;
%% simres430 = S.simres4;



%% simdist1 = S.dist1;
%% simdist2 = S.dist2;
%% simdist3 = S.dist3;
%% [f1,x1] = ecdf(simdist1);
%% [f2,x2] = ecdf(simdist2);
%% [f3,x3] = ecdf(simdist3);

%% plot(10*log10(x1),1-f1,'--','color','#0072BD','linewidth',2)
%% plot(10*log10(x2),1-f2,'--','color','#D95319','linewidth',2)
%% plot(10*log10(x3),1-f3,'--', 'color','#EDB120','linewidth',2)


tau = linspace(-7,4,23);
simtau=linspace(-7,4,12);


%% plot(simtau,simres1exp,'-*','color',"#0072BD",'linewidth',2)
%% plot(simtau,simres2exp,'-s','color',"#D95319",'linewidth',2)
%% plot(simtau,simres3exp,'-^','color',"#EDB120",'linewidth',2)




figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');


plot(tau,theoryres1,'-*','color',"#0072BD",'linewidth',2)
plot(tau,theoryres2,'-s','color',"#D95319",'linewidth',2)
plot(tau,theoryres3,'-^','color',"#EDB120",'linewidth',2)
%plot(tau,theoryres4,'color',"blue",'linewidth',2)

%% plot(simtau,simres1exp,'--','color',"black",'linewidth',1)
%% plot(simtau,simres2exp,'--','color',"black",'linewidth',1)
%% plot(simtau,simres3exp,'--','color',"black",'linewidth',1)


%plot(simtau,simres190,'--','color',"black",'linewidth',1)
%plot(simtau,simres290,'--','color',"black",'linewidth',1)
%plot(simtau,simres390,'--','color',"black",'linewidth',1)
%plot(simtau,simres490,'--','color',"black",'linewidth',1)

%% plot(simtau,simres170,'--','color',"black",'linewidth',1)
%% plot(simtau,simres270,'--','color',"black",'linewidth',1)
%% plot(simtau,simres370,'--','color',"black",'linewidth',1)
%% %plot(simtau,simres470,'--','color',"black",'linewidth',1)


%% plot(simtau,simres160,'--','color',"black",'linewidth',1)
%% plot(simtau,simres260,'--','color',"black",'linewidth',1)
%% plot(simtau,simres360,'--','color',"black",'linewidth',1)

plot(simtau,simres140,'--','color',"black",'linewidth',1)
plot(simtau,simres240,'--','color',"black",'linewidth',1)
plot(simtau,simres340,'--','color',"black",'linewidth',1)

%plot(simtau,simres130,'--','color',"black",'linewidth',1)
%plot(simtau,simres230,'--','color',"black",'linewidth',1)
%plot(simtau,simres330,'--','color',"black",'linewidth',1)

%plot(simtau,simres440,'--','color',"black",'linewidth',1)

fill([-10,fliplr(-10)],[1,fliplr(1)],[0 0 0],'FaceAlpha',0.3,'EdgeColor','none');
fill([-10,fliplr(-10)],[1,fliplr(1)],[1 1 1],'FaceAlpha',0.3,'EdgeColor','none');
fill([-10,fliplr(-10)],[1,fliplr(1)],[1 1 1],'FaceAlpha',0.3,'EdgeColor','none');


fill([simtau,fliplr(simtau)],[simres140',fliplr(simres190')],[0 0.4470 0.7410],'FaceAlpha',0.3,'EdgeColor','none');

fill([simtau,fliplr(simtau)],[simres240',fliplr(simres290')],[0.8500 0.3250 0.0980],'FaceAlpha',0.3,'EdgeColor','none');

fill([simtau,fliplr(simtau)],[simres340',fliplr(simres390')],[0.9290 0.6940 0.1250],'FaceAlpha',0.3,'EdgeColor','none');

%%fill([simtau,fliplr(simtau)],[simres440',fliplr(simres490')],[0.9290 0.6940 0.1250],'FaceAlpha',0.3,'EdgeColor','none');




legend('Theory; k=1 (exponential shadowing)','Theory; k=2 (exponential shadowing)','Theory; k=3 (exponential shadowing)','Simulated values (log-normal shadowing)','Interpreter','latex',...
    'FontSize',14,BackgroundAlpha=.5)

xlabel('$\tau$(dB)','FontSize',14,'Interpreter','latex')
ylabel('$\mathcal{P}^{(k)}(\tau)$','FontSize',14,'Interpreter','latex')
title('$\tilde{\kappa}\rho_{\epsilon}= 1$','FontSize',14,'Interpreter','latex')
grid on
axis([[-7,4],[0,1]])

latex2axes(figure1,"Times New Roman",14,"normal")
