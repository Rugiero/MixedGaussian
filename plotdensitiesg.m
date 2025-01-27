clear all;
%close all;
%addpath("/home/ilari/fillbetweenareacurve")
rho=log(10)/10;
%% muLoS=0*rho;
%% muNLoS=-12*rho
muLoS=0*rho;
muNLoS=-26*rho;

%% sigmaLoS=2.8*rho;
%% sigmaNLoS=9*rho
sigmaLoS=4*rho;
sigmaNLoS=6*rho;

%mLoS=exp(muLoS+sigmaLoS^2)/sqrt(2);
%mNLoS=exp(muNLoS+sigmaNLoS^2)/sqrt(2);
%%mLoS=exp(muLoS+sigmaLoS^2/2);
%%mNLoS=exp(muNLoS+sigmaNLoS^2/2);
%mLoS = sqrt(exp(2*muLoS+sigmaLoS^2)*(-1+exp(sigmaLoS^2)));
%mNLoS = sqrt(exp(2*muNLoS+sigmaNLoS^2)*(-1+exp(sigmaNLoS^2)));


%beta=2.3;
kappa=1;

elevation1=90;
elevation2=80;
elevation3=60;

lnLoS = makedist('Lognormal','mu',muLoS,'sigma',sigmaLoS);
lnNLoS = makedist('Lognormal','mu',muNLoS,'sigma',sigmaNLoS)


%pLoS=exp(-beta*cot(deg2rad(elevation1)));

pLoS=0.992;
a = (2*exp(muNLoS+sigmaNLoS^2/2)*(-1+pLoS)-2*exp(muLoS+sigmaLoS^2/2)*pLoS)/(exp(2*(muNLoS+sigmaNLoS^2))*(-1+pLoS)-exp(2*(muLoS+sigmaLoS^2))*pLoS);
b=(-exp(2*muNLoS+sigmaNLoS^2)*(-1+pLoS)+exp(2*(muLoS+sigmaLoS^2))*pLoS)/(2*(exp(muNLoS+sigmaNLoS^2/2)*(-1+pLoS)-exp(muLoS+sigmaLoS^2/2)*pLoS)^2);
1/b
%a=1/2*exp(muNLoS+3*sigmaNLoS^2/2);
lnFH1 = @(t) kappa*pLoS*(1-cdf(lnLoS,t/a))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t/a))./t;
%%pLoS=exp(-beta*cot(deg2rad(elevation2)));
%% pLoS=0.968;
%% lnFH2 = @(t) kappa*pLoS*(1-cdf(lnLoS,t))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t))./t;
%%pLoS=exp(-beta*cot(deg2rad(elevation3)));


expFH1 = @(t) kappa*(exp(-t)/b)./t;


pLoS=0.968;
a = (2*exp(muNLoS+sigmaNLoS^2/2)*(-1+pLoS)-2*exp(muLoS+sigmaLoS^2/2)*pLoS)/(exp(2*(muNLoS+sigmaNLoS^2))*(-1+pLoS)-exp(2*(muLoS+sigmaLoS^2))*pLoS);
b=(-exp(2*muNLoS+sigmaNLoS^2)*(-1+pLoS)+exp(2*(muLoS+sigmaLoS^2))*pLoS)/(2*(exp(muNLoS+sigmaNLoS^2/2)*(-1+pLoS)-exp(muLoS+sigmaLoS^2/2)*pLoS)^2);
1/b
expFH2 = @(t) kappa*(exp(-t)/b)./t;
lnFH2 = @(t) kappa*pLoS*(1-cdf(lnLoS,t/a))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t/a))./t;



pLoS=0.613;
a = (2*exp(muNLoS+sigmaNLoS^2/2)*(-1+pLoS)-2*exp(muLoS+sigmaLoS^2/2)*pLoS)/(exp(2*(muNLoS+sigmaNLoS^2))*(-1+pLoS)-exp(2*(muLoS+sigmaLoS^2))*pLoS);
b=(-exp(2*muNLoS+sigmaNLoS^2)*(-1+pLoS)+exp(2*(muLoS+sigmaLoS^2))*pLoS)/(2*(exp(muNLoS+sigmaNLoS^2/2)*(-1+pLoS)-exp(muLoS+sigmaLoS^2/2)*pLoS)^2);
1/b
expFH3 = @(t) kappa*(exp(-t)/b)./t;

lnFH3 = @(t) kappa*pLoS*(1-cdf(lnLoS,t/a))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t/a))./t;


min=0.01;
max = 2;

% Create figure
figure1 = figure;
%Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');


t=linspace(min,max,250);
plot([-1],[-1],'color','black','linewidth',2)
plot([-1],[-1],'--','color','black','linewidth',2)
plot(t,kappa./t.*(t<=1),'-.', 'color','black','linewidth',2)

plot(t,lnFH1(t),'color','#0072BD','linewidth',2)
%plot(t,lnFH2(t),'color','#D95319','linewidth',2)
plot(t,lnFH3(t),'color','#A2142F','linewidth',2)
plot(t,expFH1(t),'--','color','#0072BD','linewidth',2)
%plot(t,expFH2(t),'--','color','#D95319','linewidth',2)
plot(t,expFH3(t),'--', 'color','#A2142F','linewidth',2)


ylabel('$\lambda_{\mathcal{G}}(t)$','FontSize',14,'Interpreter','latex','Rotation',0)
xlabel('t','FontSize',14,'Interpreter','latex')
% Create title
title('Density function of the gain process with $\tilde{\kappa}=1$',...
      'Interpreter','latex');

fill([t,fliplr(t)],[lnFH1(t),fliplr(expFH1(t))],[0 0.4470 0.7410],'FaceAlpha',0.3,'EdgeColor','none');

%% fill([t,fliplr(t)],[lnFH2(t),fliplr(expFH2(t))],[0.8500 0.3250 0.0980],'FaceAlpha',0.3,'EdgeColor','none');

fill([t,fliplr(t)],[lnFH3(t),fliplr(expFH3(t))],[0.9290 0.6940 0.1250],'FaceAlpha',0.3,'EdgeColor','none');

axis([[0,max],[0,5]])
legend('Mixed log-normal shadowing','Exponential shadowing; $\lambda_{\mathcal{G}}(t)=\tilde{\kappa}\upsilon_{\epsilon}e^{-t}/t$',...
       'No shadowing; $\lambda_{\mathcal{G}}(t)=\tilde{\kappa}/t, t \in(0,1)$',...
    'Interpreter','latex',...
    'FontSize',14)
fontsize(14,"points")

% Create text
text('Parent',axes1,'FontSize',14,'Interpreter','latex',...
    'String','$\epsilon=$',...
    'Position',[0.00691244239631361 0.214714714714713 0]);

% Create text
text('Parent',axes1,'FontSize',14,'Interpreter','latex','String','$40$',...
    'Position',[0.15 0.199699699699698 0],...
    'Color',[0.6350 0.0780 0.1840]);


% Create text
text('Parent',axes1,'FontSize',14,'Interpreter','latex','String','$90$',...
    'Position',[0.28 0.199699699699699 0],...
    'Color',[0 0.447058823529412 0.741176470588235]);

% Create arrow
annotation(figure1,'arrow',[0.287719298245614 0.371929824561403],...
    [0.196777777777778 0.306666666666667]);

% Create textbox
annotation(figure1,'textbox',...
    [0.21 0.127571429777722 0.0508928561583162 0.0642857130794298],...
    'String',{','},...
    'LineStyle','none');

grid on
ax = gca;
ax.FontSize = 14;
