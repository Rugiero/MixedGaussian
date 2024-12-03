clear all;
close all;



S = importdata("SINRdists0.1.mat");
simdist1 = S.dist1;
simdist2 = S.dist2;
simdist3 = S.dist3;
[f1,x1] = ecdf(simdist1);
[f2,x2] = ecdf(simdist2);
[f3,x3] = ecdf(simdist3);

plot(10*log10(x1),1-f1,'--','color','#0072BD','linewidth',2)
plot(10*log10(x2),1-f2,'--','color','#D95319','linewidth',2)
plot(10*log10(x3),1-f3,'--', 'color','#EDB120','linewidth',2)

axis([[10*log10(min(tau)),10*log10(max(tau))],[0,1]])
grid on
ax = gca;
ax.FontSize = 14;
yticks([0 0.2 0.4 0.6 0.8 1])
xticks(round(linspace(10*log10(min(tau)),round(10*log10(max(tau))),5),1))
title('','FontSize',14,'Interpreter','latex')


latex2axes(figure1,"Times New Roman",14,"normal")
