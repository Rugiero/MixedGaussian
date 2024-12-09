S = importdata("bandpLoS.mat");
bs=flip(S.bs);
bs=bs';
pLoS=flip(S.pLoS)';
elevations=linspace(90,40,6);

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(elevations,pLoS,'-s','linewidth',2)
plot(elevations,bs,'-^','linewidth',2)

set ( gca, 'xdir', 'reverse' )
xlabel('Elevation angle $\epsilon$ of the SBS($^{\circ}$)','FontSize',14,'Interpreter','latex')

legend('$p_{\textrm{LoS}}$','$B_{p_{\textrm{LoS}}}$','Interpreter','latex',...
    'FontSize',14,BackgroundAlpha=.5)

latex2axes(figure1,"Times New Roman",14,"normal")
grid on


