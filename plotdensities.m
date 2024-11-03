clear all;
%close all;
%addpath("/home/ilari/fillbetweenareacurve")
rho=log(10)/10;
muLoS=0*rho;
muNLoS=-12*rho
%muLoS=12*rho;
%muNLoS=0*rho;

sigmaLoS=2.8*rho;
sigmaNLoS=9*rho;
%mLoS=exp(muLoS+sigmaLoS^2)/sqrt(2);
%mNLoS=exp(muNLoS+sigmaNLoS^2)/sqrt(2);
%%mLoS=exp(muLoS+sigmaLoS^2/2);
%%mNLoS=exp(muNLoS+sigmaNLoS^2/2);
%mLoS = sqrt(exp(2*muLoS+sigmaLoS^2)*(-1+exp(sigmaLoS^2)));
%mNLoS = sqrt(exp(2*muNLoS+sigmaNLoS^2)*(-1+exp(sigmaNLoS^2)));


beta=2.3;
kappa=1;

elevation1=90;
elevation2=80;
elevation3=60;

lnLoS = makedist('Lognormal','mu',muLoS,'sigma',sigmaLoS);
lnNLoS = makedist('Lognormal','mu',muNLoS,'sigma',sigmaNLoS)

ms= solveexpmeans(elevation1);
expLoS1 = makedist('Exponential','mu',ms(1));
expNLoS1 = makedist('Exponential','mu',ms(2));

ms= solveexpmeans(elevation2);
expLoS2 = makedist('Exponential','mu',ms(1));
expNLoS2 = makedist('Exponential','mu',ms(2));

ms= solveexpmeans(elevation3);
expLoS3 = makedist('Exponential','mu',ms(1));
expNLoS3 = makedist('Exponential','mu',ms(2));

"LoS"
(mean(lnLoS)-mean(expLoS1))^2
%var(lnLoS)
abs(var(lnLoS)+mean(lnLoS)^2-(var(expLoS2)+mean(expLoS2)^2))
"NLoS"
(mean(lnNLoS)-mean(expNLoS1))^2
%var(lnNLoS)
(var(lnNLoS)+mean(lnNLoS)^2-(var(expNLoS2)+mean(expNLoS2)^2))^2

pLoS=exp(-beta*cot(deg2rad(elevation1)));
lnFH1 = @(t) kappa*pLoS*(1-cdf(lnLoS,t))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t))./t;
pLoS=exp(-beta*cot(deg2rad(elevation2)));
lnFH2 = @(t) kappa*pLoS*(1-cdf(lnLoS,t))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t))./t;
pLoS=exp(-beta*cot(deg2rad(elevation3)));
lnFH3 = @(t) kappa*pLoS*(1-cdf(lnLoS,t))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t))./t;

pLoS=exp(-beta*cot(deg2rad(elevation1)));
expFH1 = @(t) kappa*pLoS*(1-cdf(expLoS1,t))./t+kappa*(1-pLoS)*(1-cdf(expNLoS1,t))./t;
pLoS=exp(-beta*cot(deg2rad(elevation2)));
expFH2 = @(t) kappa*pLoS*(1-cdf(expLoS2,t))./t+kappa*(1-pLoS)*(1-cdf(expNLoS2,t))./t;
pLoS=exp(-beta*cot(deg2rad(elevation3)));
expFH3 = @(t) kappa*pLoS*(1-cdf(expLoS3,t))./t+kappa*(1-pLoS)*(1-cdf(expNLoS3,t))./t;

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
plot(t,1./t.*(t<=1),'-.', 'color','black','linewidth',2)

plot(t,lnFH1(t),'color','#0072BD','linewidth',2)
plot(t,lnFH2(t),'color','#D95319','linewidth',2)
plot(t,lnFH3(t),'color','#EDB120','linewidth',2)
plot(t,expFH1(t),'--','color','#0072BD','linewidth',2)
plot(t,expFH2(t),'--','color','#D95319','linewidth',2)
plot(t,expFH3(t),'--', 'color','#EDB120','linewidth',2)


ylabel('$\lambda_{\mathcal{G}}(t)$','FontSize',14,'Interpreter','latex','Rotation',0)
xlabel('t','FontSize',14,'Interpreter','latex')
% Create title
title('Density function of the GP',...
      'Interpreter','latex');

fill([t,fliplr(t)],[lnFH1(t),fliplr(expFH1(t))],[0 0.4470 0.7410],'FaceAlpha',0.3,'EdgeColor','none');

fill([t,fliplr(t)],[lnFH2(t),fliplr(expFH2(t))],[0.8500 0.3250 0.0980],'FaceAlpha',0.3,'EdgeColor','none');

fill([t,fliplr(t)],[lnFH3(t),fliplr(expFH3(t))],[0.9290 0.6940 0.1250],'FaceAlpha',0.3,'EdgeColor','none');

axis([[0,max],[0,5]])
legend('Mixed log-normal shadowing','Mixed exponential shadowing',...
       'No shadowing; $\tilde{\kappa}/t, t \in(0,1)$',...
    'Interpreter','latex',...
    'FontSize',14)
fontsize(14,"points")

% Create text
text('Parent',axes1,'FontSize',14,'Interpreter','latex',...
    'String','$p_{\textrm{LoS}}=$',...
    'Position',[0.00691244239631361 0.214714714714713 0]);

% Create text
text('Parent',axes1,'FontSize',14,'Interpreter','latex','String','$0.3$',...
    'Position',[0.301843317972351 0.199699699699698 0],...
    'Color',[0.929411764705882 0.694117647058824 0.125490196078431]);

% Create text
text('Parent',axes1,'FontSize',14,'Interpreter','latex','String','$0.7$',...
    'Position',[0.453917050691244 0.199699699699699 0],...
    'Color',[0.850980392156863 0.325490196078431 0.0980392156862745]);

% Create text
text('Parent',axes1,'FontSize',14,'Interpreter','latex','String','$1$',...
    'Position',[0.61520737327189 0.199699699699699 0],...
    'Color',[0 0.447058823529412 0.741176470588235]);

% Create arrow
annotation(figure1,'arrow',[0.342857142857143 0.457142857142857],...
    [0.20952380952381 0.304761904761906],'LineWidth',1);

% Create textbox
annotation(figure1,'textbox',...
    [0.280357142857139 0.12757142977772 0.0508928561583162 0.0642857130794298],...
    'String',{','},...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.337499999999995 0.127571429777722 0.0508928561583162 0.0642857130794298],...
    'String',{','},...
    'LineStyle','none');

grid on
ax = gca;
ax.FontSize = 14;