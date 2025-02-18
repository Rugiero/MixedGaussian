clear all;
rho=log(10)/10;
muLoS=0*rho;
muNLoS=-26*rho;
sigmaLoS=4*rho;
sigmaNLoS=6*rho;



upsilon=@(pLoS) 1/((-exp(2*muNLoS+sigmaNLoS^2)*(-1+pLoS)+exp(2*(muLoS+sigmaLoS^2))*pLoS)/(2*(exp(muNLoS+sigmaNLoS^2/2)*(-1+pLoS)-exp(muLoS+sigmaLoS^2/2)*pLoS)^2));


