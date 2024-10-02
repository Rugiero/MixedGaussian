clear all;
%close all;

addpath("/home/ilari/genexpint")


S = importdata("SINRdists1.mat");
simdist1 = S.dist1;
simdist2 = S.dist2;
simdist3 = S.dist3;
[f1,x1] = ecdf(simdist1);
[f2,x2] = ecdf(simdist2);
[f3,x3] = ecdf(simdist3);

S = importdata("SINRdists5.mat");
simdist1 = S.dist1;
simdist2 = S.dist2;
simdist3 = S.dist3;
[f4,x4] = ecdf(simdist1);
[f5,x5] = ecdf(simdist2);
[f6,x6] = ecdf(simdist3);

%% S = importdata("SINRdists10.mat");
%% simdist1 = S.dist1;
%% simdist2 = S.dist2;
%% simdist3 = S.dist3;
%% [f7,x7] = ecdf(simdist1);
%% [f8,x8] = ecdf(simdist2);
%% [f9,x9] = ecdf(simdist3);

tau = linspace(1,10,250);

dist1=[];
dist2=[];
dist3=[];
dist4=[];
dist5=[];
dist6=[];
dist7=[];
dist8=[];
dist9=[];

w=0.1;
c1=1;
c2=5;
c3=2;

elevation1=90;
elevation2=80;
elevation3=60;

for theta = tau 
  dist1 = [dist1 pc(theta,c1,w,elevation1)];
end


for theta = tau 
  dist2 = [dist2 pc(theta,c1,w,elevation2)];
end

for theta = tau 
  dist3 = [dist3 pc(theta,c1,w,elevation3)];
end


for theta = tau 
  dist4 = [dist4 pc(theta,c2,w,elevation1)];
end

for theta = tau 
  dist5 = [dist5 pc(theta,c2,w,elevation2)];
end

for theta = tau 
  dist6 = [dist6 pc(theta,c2,w,elevation3)];
end


%% for theta = tau 
%%   dist7 = [dist7 pc(theta,c3,w,elevation1)];
%% end

%% for theta = tau 
%%   dist8 = [dist8 pc(theta,c3,w,elevation2)];
%% end


%% for theta = tau 
%%   dist9 = [dist9 pc(theta,c3,w,elevation3)];
%% end

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot([-1],[-1],'color','black','linewidth',2)

plot([-1],[-1],'--','color','black','linewidth',2)
plot(10*log10(tau),dist1,'color',"#0072BD",'linewidth',2)
plot(10*log10(tau),dist2,'color',"#D95319",'linewidth',2)
plot(10*log10(tau),dist3,'color',"#EDB120",'linewidth',2)
plot(10*log10(tau),dist4,'color',"#0072BD",'linewidth',2)
plot(10*log10(tau),dist5,'color',"#D95319",'linewidth',2)
plot(10*log10(tau),dist6,'color',"#EDB120",'linewidth',2)
%% plot(10*log10(tau),dist7,'color',"#0072BD",'linewidth',2)
%% plot(10*log10(tau),dist8,'color',"#D95319",'linewidth',2)
%% plot(10*log10(tau),dist9,'color',"#EDB120",'linewidth',2)

%plot(10*log10(tau),(1+tau).^-c2.*genexpint(c2+1,w.*tau)*c2,'color',"black",'linewidth',2)

%% nakdist1=[];
%% m=10;
%% for theta = tau 
%%   nakdist1 = [nakdist1 mthmomentSINR(m,1,c2,theta,w)];
%% end

%plot(10*log10(tau),nakdist1,'color','b','linewidth',2)
tau1 = linspace(0.1,max(tau),10000);
nakdist1=[];
 
plot(10*log10(x1),1-f1,'--','color','#0072BD','linewidth',2)
plot(10*log10(x2),1-f2,'--','color','#D95319','linewidth',2)
plot(10*log10(x3),1-f3,'--', 'color','#EDB120','linewidth',2)

plot(10*log10(x4),1-f4,'--','color','#0072BD','linewidth',2)
plot(10*log10(x5),1-f5,'--','color','#D95319','linewidth',2)
plot(10*log10(x6),1-f6,'--', 'color','#EDB120','linewidth',2)

%%  plot(10*log10(x7),1-f7,'--','color','#0072BD','linewidth',2)
%%  plot(10*log10(x8),1-f8,'--','color','#D95319','linewidth',2)
%%  plot(10*log10(x9),1-f9,'--', 'color','#EDB120','linewidth',2)

axis([[10*log10(min(tau1)),10*log10(max(tau))],[0,1]])

grid on
ax = gca;
ax.FontSize = 14;
yticks([0 0.2 0.4 0.6 0.8 1])
xticks(round(linspace(10*log10(min(tau1)),round(10*log10(max(tau1))),5),1))
title('Interference-plus-noise-limited channel with $W= 0.2 \cdot(\hat{d}_{\epsilon,h}/d_0)^{-\gamma}$','FontSize',14,'Interpreter','latex')

%% text(1,0.6,'${m}=1,2,5$','FontSize',14,'Interpreter','latex')
%% text(1,0.6,'$\kappa=0.1 \log(2)$','FontSize',14,'Interpreter','latex')
%% text(1,0.6,'$\kappa=\log(2)$','FontSize',14,'Interpreter','latex')
%% text(1,0.6,'$\kappa=10\log(2)$','FontSize',14,'Interpreter','latex')

legend('Analysis; $\hat{F}^{{\textrm{SINR}}}_{{\kappa,W,m}}(\theta)$','Simulated actual',...
    'Interpreter','latex',...
    'FontSize',14)
fontsize(14,"points")


