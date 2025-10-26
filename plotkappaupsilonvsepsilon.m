clear all;
S = importdata("ploses.mat");
rho=log(10)/10;
muLoS=0*rho;
muNLoS=-26*rho;
sigmaLoS=4*rho;
sigmaNLoS=6*rho;



upsilon=@(pLoS) 1./((-exp(2*muNLoS+sigmaNLoS^2).*(-1+pLoS)+exp(2.*(muLoS+sigmaLoS.^2))*pLoS)./(2*(exp(muNLoS+sigmaNLoS^2./2).*(-1+pLoS)-exp(muLoS+sigmaLoS^2/2).*pLoS).^2));



epsilons=linspace(90,10,9);

% Create figure
figure1 = figure;
%Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(epsilons,S,'-x','color','#0072BD','linewidth',2)
plot(linspace(90,10,100),sin(deg2rad(linspace(90,10,100))),'--','linewidth',2)
plot(epsilons,upsilon(S'),'-x','linewidth',2)

set ( gca, 'xdir', 'reverse' )
xlabel('$\epsilon[{}^{\circ}]$','FontSize',14,'Interpreter','latex')

title('$p_{\textrm{LoS}}$ and $\upsilon$ w.r.t. the elevation angle',...
      'Interpreter','latex');
grid on
ax = gca;
ax.FontSize = 14;

pbaspect([2 0.6 0.6])
axis([[30,90],[0.4,1]])

legend('$p_{\textrm{LoS}}=p_{\textrm{LoS}}(\epsilon)$','$\sin(\epsilon)$',...
    '$\upsilon=\upsilon(\epsilon)$','Interpreter','latex',...
    'FontSize',14)
fontsize(14,"points")

latex2axes(figure1,"Times New Roman",14,"normal")
