S = importdata("ICtheorydiff.mat");
theoryres1 = round(S.theoryres1,3);
theoryres2 = round(S.theoryres2,3);

S = importdata("simdiff90.mat");
simresIC90 = round(S.simresIC,3);
simresSC90 = round(S.simresSC,3);

S = importdata("simdiff40.mat");
simresIC40 = round(S.simresIC,3);
simresSC40 = round(S.simresSC,3);


%% S = importdata("ICsimexp.mat");
%% simexp1 = round(S.simres1,2);
%% simexp2 = round(S.simres2,2);
%% simexp3 = round(S.simres3,2);

%% S = importdata("ICprobssim90tau1.mat");
%% simres4 = S.simres1;
%% simres5 = S.simres2;
%% simres6 = S.simres3;

%% S = importdata("ICprobssim40tau1.mat");
%% simres7 = S.simres1;
%% simres8 = S.simres2;
%% simres9 = S.simres3;
 

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');


tau = -7:0.4:10;
simtau=-7:1:10;
%simkappa = [1 2 6 10];



%plot(simtau,simresSC40,'--','color',"black",'linewidth',1)
%plot(simtau,simresIC40,'--','color',"black",'linewidth',1)
%plot(simtau,simresSC90,'--','color',"black",'linewidth',1)
%plot(simtau,simresIC90,'--','color',"black",'linewidth',1)


%% fill([simkappa,fliplr(simkappa)],[simres9',fliplr(simres6')],[0.9290 0.6940 0.1250],'FaceAlpha',0.3,'EdgeColor','none');

plot(tau,theoryres1,'--','color',"#7E2F8E",'linewidth',2)
plot(tau,theoryres2,'-','color',"#77AC30",'linewidth',2)
fill([-10,fliplr(-10)],[1,fliplr(1)],[0 0 0],'FaceAlpha',0.2,'EdgeColor','none');
fill([-10,fliplr(-10)],[1,fliplr(1)],[1 1 1],'FaceAlpha',0.2,'EdgeColor','none');
fill([simtau,fliplr(simtau)],[simresIC40',fliplr(simresIC90')],[0.4940 0.1840 0.5560],'FaceAlpha',0.2,'EdgeColor','none');

fill([simtau,fliplr(simtau)],[simresSC40',fliplr(simresSC90')],[0.4660 0.6740 0.1880],'FaceAlpha',0.2,'EdgeColor','none');



legend('Analysis; IC','Analysis; SC','Simulated values','Interpreter','latex',...
    'FontSize',14,BackgroundAlpha=.5)



grid on
axis([[-7,10],[0,0.5]])
xlabel('$\theta \textrm{ [dB]}$','FontSize',14,'Interpreter','latex')
ylabel('$\Delta^{(2)}(\theta,\tau)$','FontSize',14,'Interpreter','latex')
%xticks([-7:2:10])

xticks(-7:2:10);

title('$\tilde{\kappa}\rho_{\epsilon}=2.6$','Interpreter','latex',...
    'FontSize',14)


% Create textarrow
annotation(figure1,'textarrow',[0.578947368421053 0.496491228070175],...
    [0.637777777777778 0.577777777777778],'String',{'$\epsilon=40^{\circ}$'},...
    'Interpreter','latex',...
    'FontSize',14);

% Create textbox
annotation(figure1,'textbox',...
    [0.436842105263158 0.525666665818956 0.0692982466531262 0.064444445292155],...
    'String',{'$90^{\circ}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',14,...
    'FitBoxToText','off');

% Create textarrow
annotation(figure1,'textarrow',[0.308771929824562 0.357894736842105],...
    [0.651111111111111 0.62],'String',{'$\epsilon=90^{\circ}$'},...
    'Interpreter','latex',...
    'FontSize',14);

% Create textbox
annotation(figure1,'textbox',...
    [0.347368421052632 0.581222221374512 0.0692982466531263 0.064444445292155],...
    'String',{'$40^{\circ}$'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',14,...
    'FitBoxToText','off');


latex2axes(figure1,"Times New Roman",14,"normal")
