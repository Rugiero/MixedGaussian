%%Probability of coverage.
function PC=pc(THETA,kappa,w,elevation)
  rho=log(10)/10;
  muLoS=0*rho;
  muNLoS=-12*rho;
  sigmaLoS=2.8*rho;
  %%sigmaLoS=0.001*rho;
  sigmaNLoS=9*rho;
  %mLoS=exp(muLoS+sigmaLoS^2/2);
  %mNLoS=exp(muNLoS+sigmaNLoS^2/2);
  %%   mLoS = sqrt(exp(2*muLoS+sigmaLoS^2)*(-1+exp(sigmaLoS^2)));
  %% mNLoS = sqrt(exp(2*muNLoS+sigmaNLoS^2)*(-1+exp(sigmaNLoS^2)));
  %%mLoS=exp(muLoS+sigmaLoS^2)/sqrt(2);
  %%mNLoS=exp(muNLoS+sigmaNLoS^2)/sqrt(2);
  ms= solveexpmeans(elevation);
  mLoS = ms(1);
  mNLoS = ms(2);
  PC=[];
  beta=2.3;
  pLoS=exp(-beta*cot(deg2rad(elevation)));  
  for theta = THETA
    integrand = @(v) kappa.*pLoS*exp(-theta.*v.*w./mLoS)./(v.*(1+theta.*v.*mNLoS/mLoS).^(kappa.*(1-pLoS)).*(1+theta.*v).^(kappa*pLoS))+...
		kappa*(1-pLoS)*exp(-theta.*v*w/mNLoS)./(v.*(1+theta.*v).^(kappa.*(1-pLoS)).*(1+theta.*mLoS./mNLoS.*v).^(kappa*pLoS));
    PC = [PC integral(integrand,1,inf)];
  end 
end
