clear all;
%close all;
rho=log(10)/10;
muLoS=0*rho;
muNLoS=-16.8*rho;
sigmaLoS=0.4*rho;
sigmaNLoS=10.8*rho;
pLoS=0.998;
kappa=1;

lnLoS = makedist('Lognormal','mu',muLoS,'sigma',sigmaLoS);
lnNLoS = makedist('Lognormal','mu',muNLoS,'sigma',sigmaNLoS)


lnFH1 = @(t) kappa*pLoS*(1-cdf(lnLoS,t))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t))./t;

shift=0.540458;
lambda=2.16121;
expFH1 = @(t) kappa*exp(-(t-shift)*lambda)./t.*(t>shift)+...
kappa./t.*(t<=shift);

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
plot(t,expFH1(t),'--','color','#0072BD','linewidth',2)



ylabel('$\lambda_{\mathcal{G}}(t)$','FontSize',14,'Interpreter','latex','Rotation',0)
xlabel('t','FontSize',14,'Interpreter','latex')
% Create title
title('Density function of the GP',...
      'Interpreter','latex');

fill([t,fliplr(t)],[lnFH1(t),fliplr(expFH1(t))],[0 0.4470 0.7410],'FaceAlpha',0.3,'EdgeColor','none');


legend('Mixed log-normal shadowing','Shifted exponential shadowing','FontSize',14,'Interpreter','latex')

axis([[0,max],[0,5]])

grid on
ax = gca;
ax.FontSize = 14;
