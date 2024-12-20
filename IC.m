S = importdata("ICtheory.mat");
theoryres1 = round(S.theoryres1,2);
theoryres2 = round(S.theoryres2,2);
theoryres3 = round(S.theoryres3,2);

%% S = importdata("ICsimexp.mat");
%% simexp1 = round(S.simres1,2);
%% simexp2 = round(S.simres2,2);
%% simexp3 = round(S.simres3,2);

S = importdata("ICprobssim90tau1.mat");
simres4 = S.simres1;
simres5 = S.simres2;
simres6 = S.simres3;

S = importdata("ICprobssim40tau1.mat");
simres7 = S.simres1;
simres8 = S.simres2;
simres9 = S.simres3;


figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');


kappa = linspace(1,10,19);
simkappa=linspace(1,10,10);
%simkappa = [1 2 6 10];

fill([simkappa,fliplr(simkappa)],[simres7',fliplr(simres4')],[0 0.4470 0.7410],'FaceAlpha',0.3,'EdgeColor','none');

fill([simkappa,fliplr(simkappa)],[simres8',fliplr(simres5')],[0.8500 0.3250 0.0980],'FaceAlpha',0.3,'EdgeColor','none');

fill([simkappa,fliplr(simkappa)],[simres9',fliplr(simres6')],[0.9290 0.6940 0.1250],'FaceAlpha',0.3,'EdgeColor','none');

plot(kappa,theoryres1,'-*','color',"#0072BD",'linewidth',2)
plot(kappa,theoryres2,'-s','color',"#D95319",'linewidth',2)
plot(kappa,theoryres3,'-^','color',"#EDB120",'linewidth',2)

%% plot(simkappa,simexp1,'--','color',"#0072BD",'linewidth',2)
%% plot(simkappa,simexp2,'--','color',"#D95319",'linewidth',2)
%% plot(simkappa,simexp3,'--','color',"#EDB120",'linewidth',2)

%% plot(simkappa,simres4,'--','color',"#0072BD",'linewidth',2)
%% plot(simkappa,simres5,'--','color',"#D95319",'linewidth',2)
%% plot(simkappa,simres6,'--','color',"#EDB120",'linewidth',2)

%% plot(simkappa,simexp1,'-s','MarkerSize',10,...
%%     'MarkerEdgeColor','red',...
%%     'MarkerFaceColor',[1 .6 .6])

%% plot(simkappa,simexp2,'-s','MarkerSize',10,...
%%     'MarkerEdgeColor','red',...
%%     'MarkerFaceColor',[1 .6 .6])

%% plot(simkappa,simexp3,'-s','MarkerSize',10,...
%%     'MarkerEdgeColor','red',...
%%     'MarkerFaceColor',[1 .6 .6])

%% plot(simkappa,simexp1,'-s','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','color',[1 .6 .6])
%% plot(simkappa,simexp2,'-s','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','color',[1 .6 .6])
%% plot(simkappa,simexp3,'-s','MarkerSize',10,'MarkerEdgeColor','red','MarkerFaceColor','color',[1 .6 .6])

fill([-10,fliplr(-10)],[1,fliplr(1)],[0 0 0],'FaceAlpha',0.3,'EdgeColor','none');
fill([-10,fliplr(-10)],[1,fliplr(1)],[1 1 1],'FaceAlpha',0.3,'EdgeColor','none');




grid on
axis([[1,10],[0,1]])
xlabel('$\tilde{\kappa}\rho_{\epsilon}$','FontSize',14,'Interpreter','latex')
ylabel('$\mathcal{P}^{(k)}_{{\textrm{IC}}}(\tau,e)$','FontSize',14,'Interpreter','latex')
xticks([linspace(1,10,10)])

legend('','','','Theory; k=1 (exponential shadowing)','Theory; k=2 (exponential shadowing)','Theory; k=3 (exponential shadowing)','Simulated values (log-normal fading)','Interpreter','latex',...
    'FontSize',14,BackgroundAlpha=.5)
title('$\tau=1$')

% Create textarrow
annotation(figure1,'textarrow',[0.214035087719298 0.163157894736842],...
    [0.746666666666667 0.708888888888889],'String',{'$\epsilon= 40^{\circ}$'},'FontSize',12,'Interpreter','latex');

% Create textbox
annotation(figure1,'textbox',...
    [0.140350877192982 0.654555556813876 0.0684210511153205 0.0644444431861242],...
    'String',{'$90^{\circ}$'},...
    'LineStyle','none','FontSize',12,'Interpreter','latex');

latex2axes(figure1,"Times New Roman",14,"normal")
 
