clear all;
%close all;

addpath("/home/ilari/genexpint")

S = importdata("SINRdists1ln.mat");
simdist1 = S.dist1;
simdist2 = S.dist2;
simdist3 = S.dist3;
[f1,x1] = ecdf(simdist1);
[f2,x2] = ecdf(simdist2);
[f3,x3] = ecdf(simdist3);


S = importdata("SINRdists5ln.mat");
simdist1 = S.dist1;
simdist2 = S.dist2;
simdist3 = S.dist3;
[f4,x4] = ecdf(simdist1);
[f5,x5] = ecdf(simdist2);
[f6,x6] = ecdf(simdist3);

S = importdata("SINRdists10ln.mat");
simdist1 = S.dist1;
simdist2 = S.dist2;
simdist3 = S.dist3;
[f7,x7] = ecdf(simdist1);
[f8,x8] = ecdf(simdist2);
[f9,x9] = ecdf(simdist3);

S = importdata("SINRdists1g.mat");
simdist1 = S.dist1;
simdist2 = S.dist2;
simdist3 = S.dist3;
[f10,x10] = ecdf(simdist1);
[f11,x11] = ecdf(simdist2);
[f12,x12] = ecdf(simdist3);


S = importdata("SINRdists5g.mat");
simdist1 = S.dist1;
simdist2 = S.dist2;
simdist3 = S.dist3;
[f13,x13] = ecdf(simdist1);
[f14,x14] = ecdf(simdist2);
[f15,x15] = ecdf(simdist3);

S = importdata("SINRdists10g.mat");
simdist1 = S.dist1;
simdist2 = S.dist2;
simdist3 = S.dist3;
[f16,x16] = ecdf(simdist1);
[f17,x17] = ecdf(simdist2);
[f18,x18] = ecdf(simdist3);


tau = linspace(1,100,10000);

dist1=[];
dist2=[];
dist3=[];
dist4=[];
dist5=[];
dist6=[];
dist7=[];
dist8=[];
dist9=[];

h=1;
d=h/sin(deg2rad(90));
alpha=2;
w=0.1/d^alpha;

c1=1;
c2=5;
c3=10;

elevation1=90;
elevation2=60;
elevation3=45;

for theta = tau 
  dist1 = [dist1 pcg(theta,c1,w,elevation1,h)];
end


for theta = tau 
  dist2 = [dist2 pcg(theta,c1,w,elevation2,h)];
end

for theta = tau 
  dist3 = [dist3 pcg(theta,c1,w,elevation3,h)];
end


for theta = tau 
  dist4 = [dist4 pcg(theta,c2,w,elevation1,h)];
end

for theta = tau 
  dist5 = [dist5 pcg(theta,c2,w,elevation2,h)];
end

for theta = tau 
  dist6 = [dist6 pcg(theta,c2,w,elevation3,h)];
end


for theta = tau 
  dist7 = [dist7 pcg(theta,c3,w,elevation1,h)];
end

for theta = tau 
  dist8 = [dist8 pcg(theta,c3,w,elevation2,h)];
end


for theta = tau 
  dist9 = [dist9 pcg(theta,c3,w,elevation3,h)];
end

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
%% plot(10*log10(tau),dist4,'color',"#0072BD",'linewidth',2)
%% plot(10*log10(tau),dist5,'color',"#D95319",'linewidth',2)
%% plot(10*log10(tau),dist6,'color',"#EDB120",'linewidth',2)
%% plot(10*log10(tau),dist7,'color',"#0072BD",'linewidth',2)
%% plot(10*log10(tau),dist8,'color',"#D95319",'linewidth',2)
%% plot(10*log10(tau),dist9,'color',"#EDB120",'linewidth',2)

%plot(10*log10(tau),(1+tau).^-c2,'color',"black",'linewidth',2)

tau1 = linspace(0.1,max(tau),10000);
nakdist1=[];
%% m=1;
%% for theta = tau1
%%   nakdist1 = [nakdist1 1 - igamma(c1,1/theta)/gamma(c1)];
%% end

%% nakdist2=[];
%% for theta = tau1
%%   nakdist2 = [nakdist2 gamcdf(1/theta,c1)];
%% end

%% nakdist3=[];
%% for theta = tau1
%%   nakdist3 = [nakdist3 gamcdf(1/theta,c2)];
%% end


%plot(10*log10(tau1),nakdist1,'color','b','linewidth',2)
%plot(10*log10(tau1),nakdist2,'color','black','linewidth',2)
%plot(10*log10(tau1),nakdist3,'color','black','linewidth',2)


%% plot(10*log10(x1),1-f1,'--','color','#0072BD','linewidth',2)
%% plot(10*log10(x2),1-f2,'--','color','#D95319','linewidth',2)
%% plot(10*log10(x3),1-f3,'--', 'color','#EDB120','linewidth',2)

%% plot(10*log10(x4),1-f4,'--','color','#0072BD','linewidth',2)
%% plot(10*log10(x5),1-f5,'--','color','#D95319','linewidth',2)
%% plot(10*log10(x6),1-f6,'--', 'color','#EDB120','linewidth',2)

%% plot(10*log10(x7),1-f7,'--','color','#0072BD','linewidth',2)
%% plot(10*log10(x8),1-f8,'--','color','#D95319','linewidth',2)
%% plot(10*log10(x9),1-f9,'--', 'color','#EDB120','linewidth',2)

plot(10*log10(x10),1-f10,'-.','color','#0072BD','linewidth',2)
plot(10*log10(x11),1-f11,'-.','color','#D95319','linewidth',2)
plot(10*log10(x12),1-f12,'-.','color','#EDB120','linewidth',2)

%% plot(10*log10(x13),1-f13,'--','color','#0072BD','linewidth',2)
%% plot(10*log10(x14),1-f14,'--','color','#D95319','linewidth',2)
%% plot(10*log10(x15),1-f15,'--','color','#EDB120','linewidth',2)

%% plot(10*log10(x16),1-f16,'--','color','#0072BD','linewidth',2)
%% plot(10*log10(x17),1-f17,'--','color','#D95319','linewidth',2)
%% plot(10*log10(x18),1-f18,'--','color','#EDB120','linewidth',2)


axis([[10*log10(min(tau1)),10*log10(max(tau))],[0,1]])
grid on
ax = gca;
ax.FontSize = 14;
yticks([0 0.2 0.4 0.6 0.8 1])
xticks(round(linspace(10*log10(min(tau1)),round(10*log10(max(tau))),5),1))
title('Interference-limited channel','FontSize',14,'Interpreter','latex')

%% text(1,0.6,'${m}=1,2,5$','FontSize',14,'Interpreter','latex')
%% text(1,0.6,'$\kappa=0.1 \log(2)$','FontSize',14,'Interpreter','latex')
%% text(1,0.6,'$\kappa=\log(2)$','FontSize',14,'Interpreter','latex')
%% text(1,0.6,'$\kappa=10\log(2)$','FontSize',14,'Interpreter','latex')

legend('Analysis; $\hat{F}^{{\textrm{SINR}}}_{{\kappa,W,m}}(\theta)$','Simulated actual',...
    'Interpreter','latex',...
    'FontSize',14)
fontsize(14,"points")


