clear all;
%close all;

S = importdata("optimalSINR.mat");
%S1 = importdata("optimalSINRN1.mat");
%S2 = importdata("optimalSINRN5.mat");


h=1200;
lambda = 10^-3*0.2;
d=h/sin(deg2rad(90));
alpha=4;
w=0.00000000000001/d^alpha;


VARPHIX1 = rad2deg(linspace(0,1,10000));
VARPHIX = rad2deg(linspace(0.001,0.0314,10));

dist1=[];
dist2=[];
dist3=[];

elevation1=90;
elevation2=60;
elevation3=45;
%% tKAPPA1= (lambda*pi*(h.*deg2rad(VARPHIX1)./(sin(elevation1).^2)).^2)/log(2);
%% tKAPPA2= (lambda*pi*(h.*deg2rad(VARPHIX1)./(sin(elevation1).^2)).^2)/log(2);
%% tKAPPA3= (lambda*pi*(h.*deg2rad(VARPHIX1)./(sin(elevation1).^2)).^2)/log(2);

tKAPPA = (lambda*pi*(h.*deg2rad(VARPHIX)./(sin(deg2rad(elevation1)).^2)).^2)/log(2); 
tKAPPA1= (lambda*pi*(h.*deg2rad(VARPHIX1)./(sin(deg2rad(elevation1)).^2)).^2)/log(2);
tKAPPA2= (lambda*pi*(h.*deg2rad(VARPHIX1)./(sin(deg2rad(elevation2)).^2)).^2)/log(2);
tKAPPA3= (lambda*pi*(h.*deg2rad(VARPHIX1)./(sin(deg2rad(elevation3)).^2)).^2)/log(2);

for(iii = 1:length(tKAPPA1))
  dist1 = [dist1 pcg(1,tKAPPA1(iii),w,elevation1,h)];
  dist2 = [dist2 pcg(1,tKAPPA2(iii),w,elevation2,h)];
  dist3 = [dist3 pcg(1,tKAPPA3(iii),w,elevation3,h)];
end
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');


%plot([-1],[-1],'color','black','linewidth',2)
hold on;
%plot(per3dBtheory,dist1,'-x','color',"#D95319",'linewidth',2)
%plot([-1],[-1],'color','black','linewidth',2)
%plot([-1],[-1],'o','color','black','linewidth',2)
%plot([-1],[-1],'-o','color','black','linewidth',2)
plot([-1],[-1],'s','MarkerSize',10,'MarkerEdgeColor',"#D95319", 'MarkerFaceColor',"#D95319")
plot([-1],[-1],'s','MarkerSize',10,'MarkerEdgeColor',"#0072BD", 'MarkerFaceColor',"#0072BD")
plot([-1],[-1],'s','MarkerSize',10,'MarkerEdgeColor',"#0072BD", 'MarkerFaceColor',"#EDB120")
								
plot(VARPHIX1,dist1,'color','#D95319','linewidth',2)
plot(VARPHIX1,dist2,'color','#0072BD','linewidth',2)
plot(VARPHIX1,dist3,'color','#EDB120','linewidth',2)

%% plot(tKAPPA1,dist1,'color','#D95319','linewidth',2)
%% plot(tKAPPA2,dist2,'color','#0072BD','linewidth',2)
%% plot(tKAPPA3,dist3,'color','#EDB120','linewidth',2)


plot(VARPHIX, S.res1','--','color','#D95319','linewidth',2)
plot(VARPHIX, S.res2','--','color','#0072BD','linewidth',2)
plot(VARPHIX, S.res3','--', 'color','#EDB120','linewidth',2)

%% plot(tKAPPA, S.res1','--','color','#D95319','linewidth',2)
%% plot(tKAPPA, S.res2','--','color','#0072BD','linewidth',2)
%% plot(tKAPPA, S.res3','--', 'color','#EDB120','linewidth',2)

% plot(per3dB,[0; S.res4],'--','color','#7E2F8E','linewidth',2)

plot(log(2)*ones(1,100), linspace(0, 2.5,100),'color','black')
text(log(2)*0.5,-0.05,'$\log(2)$','FontSize',14,'Interpreter','latex')

%% ta1 = annotation('textarrow', [.3 0.2], [0.6 0.6],'Interpreter','latex','FontSize',14);
%% ta1.String =  '$\tilde{\lambda}_M^{[0.01 \cdot P/d_{h,\epsilon}^{\gamma}, 1]} \simeq 0.3$';              
%% ta2 = annotation('textarrow', [.4 0.25], [0.35 0.35],'Interpreter','latex','FontSize',14);
%% ta2.String =  '$\tilde{\lambda}_M^{[0.3 \cdot P/d_{h,\epsilon}^{\gamma}, 1]} \simeq 0.5$';              
%% ta3 = annotation('textarrow', [.65 0.25], [0.22 0.22],'Interpreter','latex','FontSize',14);
%% ta3.String =  '$\tilde{\lambda}_M^{[1 \cdot P/d_{h,\epsilon}^{\gamma}, 1]} \simeq 0.7$';              

%text(0.3,0.62,'$\tilde{\lambda}_M^{[0.01 \cdot P/d_{h,\epsilon}^{\gamma}, 1]} \simeq 0.3$','FontSize',14,'Interpreter','latex')
%text(0.4,0.27,'$\tilde{\lambda}_M^{[0.3 \cdot P/d_{h,\epsilon}^{\gamma}, 1]} \simeq 0.5$','FontSize',14,'Interpreter','latex')
%text(0.5,0,'$\tilde{\lambda}_M^{[1 \cdot P/d_{h,\epsilon}^{\gamma}, 1]} \simeq 0.7$','FontSize',14,'Interpreter','latex')



axis([[0, 2],[0,1]])
grid on
ax = gca;
ax.FontSize = 14;
yticks(linspace(0,1,5))

ylabel('Transmission success probability','FontSize',14,'Interpreter','latex')
xlabel('${\varphi_{\textrm{RX}}}$','FontSize',14,'Interpreter','latex')

legend('90','60','45','FontSize',14,'Interpreter','latex')
fontsize(14,"points")
%xslegend('boxoff')



%text(-0.5,0.4,'$W=0.01 \frac{P}{d_{h,\epsilon}^{\gamma}}$','FontSize',14,'Interpreter','latex')
%text(0.4,0.01,'$W=1\frac{P}{d_{h,\epsilon}^{\gamma}}$','FontSize',14,'Interpreter','latex')


%% figure(2)
%% plot(10*log10(x1),1-f1,'color','black','linewidth',2)
%% hold on;
%% plot(10*log10(x2),1-f2,'color','black','linewidth',2)
%% plot(10*log10(x3),1-f3,'color','black','linewidth',2)


%% axis([[10*log10(min(tau)),10*log10(max(tau))],[0,1]])
%% grid on
%% ax = gca;
%% ax.FontSize = 14;
%% yticks([0 0.2 0.4 0.6 0.8 1])
%% xticks(round(linspace(10*log10(min(tau)),10*log10(max(tau)),5),1))

%% ylabel('F_{SIR}(y)')
%% xlabel('y (dB)')

%% legend('Approximate distribution')

