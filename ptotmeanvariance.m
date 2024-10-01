clear all;
close all;
elevation =20;
kappa=1;5
rho=log(10)/10;
muLoS=0*rho;
muNLoS=-12*rho
sigmaLoS=2.8*rho;
sigmaNLoS=9*rho;
beta=2.3;
pLoS=exp(-beta*cot(deg2rad(elevation)));

lnLoS = makedist('Lognormal','mu',muLoS,'sigma',sigmaLoS);
lnNLoS = makedist('Lognormal','mu',muNLoS,'sigma',sigmaNLoS)
meanintegrand1 = @(t) (kappa*pLoS*(1-cdf(lnLoS,t))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t))./t).*t;
varintegrand1 =@(t) (kappa*pLoS*(1-cdf(lnLoS,t))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t))./t).*t.^2;

ms= solveexpmeans(elevation);
expLoS1 = makedist('Exponential','mu',ms(1));
expNLoS1 = makedist('Exponential','mu',ms(2));
meanintegrand2 = @(t) (kappa*pLoS*(1-cdf(expLoS1,t))./t+kappa*(1-pLoS)*(1-cdf(expNLoS1,t))./t).*t;
varintegrand2 = @(t) (kappa*pLoS*(1-cdf(expLoS1,t))./t+kappa*(1-pLoS)*(1-cdf(expNLoS1,t))./t).*t.^2;

mLoS=exp(muLoS+sigmaLoS^2/2);
mNLoS=exp(muNLoS+sigmaNLoS^2/2);
expLoS2 = makedist('Exponential','mu',mLoS);
expNLoS2 = makedist('Exponential','mu',mNLoS);
meanintegrand3 = @(t) (kappa*pLoS*(1-cdf(expLoS2,t))./t+kappa*(1-pLoS)*(1-cdf(expNLoS2,t))./t).*t;
varintegrand3 = @(t) (kappa*pLoS*(1-cdf(expLoS2,t))./t+kappa*(1-pLoS)*(1-cdf(expNLoS2,t))./t).*t.^2;

integral(meanintegrand1,0,Inf)
integral(varintegrand1,0,Inf)

integral(meanintegrand2,0,Inf)
integral(varintegrand2,0,Inf)

integral(meanintegrand3,0,Inf)
integral(varintegrand3,0,Inf)

"diffs"
(integral(meanintegrand1,0,Inf)-integral(meanintegrand2,0,Inf))^2+(integral(varintegrand1,0,Inf)-integral(varintegrand2,0,Inf))^2

(integral(meanintegrand1,0,Inf)-integral(meanintegrand3,0,Inf))^2+(integral(varintegrand1,0,Inf)-integral(varintegrand3,0,Inf))^2

t=linspace(0,3,100);
plot(t,kappa*pLoS*(1-cdf(lnLoS,t))./t+kappa*(1-pLoS)*(1-cdf(lnNLoS,t))./t,'color','black','linewidth',2)
hold on;
plot(t,kappa*pLoS*(1-cdf(expLoS1,t))./t+kappa*(1-pLoS)*(1-cdf(expNLoS1,t))./t,'color','blue','linewidth',2)

plot(t,kappa*pLoS*(1-cdf(expLoS2,t))./t+kappa*(1-pLoS)*(1-cdf(expNLoS2,t))./t,'color','red','linewidth',2)
axis([[0,3],[0,5]])

