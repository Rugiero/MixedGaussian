S = importdata("ICtheory.mat");
theoryres1 = round(S.theoryres1,2);
theoryres2 = round(S.theoryres2,2);
theoryres3 = round(S.theoryres3,2);

S = importdata("ICsimexp.mat");
simexp1 = round(S.simres1,2);
simexp2 = round(S.simres2,2);
simexp3 = round(S.simres3,2);


figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');


kappa = linspace(1,10,19);
simkappa=linspace(1,10,10);


plot(kappa,theoryres1,'-*','color',"#0072BD",'linewidth',2)
plot(kappa,theoryres2,'-s','color',"#D95319",'linewidth',2)
plot(kappa,theoryres3,'-^','color',"#EDB120",'linewidth',2)

plot(simkappa,simexp1,'--','color',"black",'linewidth',1)
plot(simkappa,simexp2,'--','color',"black",'linewidth',1)
plot(simkappa,simexp3,'--','color',"black",'linewidth',1)


grid on
axis([[1,10],[0,1]])
xlabel('$\tilde{\kappa}\rho_{\epsilon}$','FontSize',14,'Interpreter','latex')
ylabel('$\mathcal{P}^{(k)}_{{IC}}(\tau,e)$','FontSize',14,'Interpreter','latex')
xticks([linspace(1,10,10)])

legend('Theory; k=1 (exponential shadowing)','Theory; k=2 (exponential shadowing)','Theory; k=3 (exponential shadowing)','Interpreter','latex',...
    'FontSize',14,BackgroundAlpha=.5)
title('$\tau=1$')


latex2axes(figure1,"Times New Roman",14,"normal")
