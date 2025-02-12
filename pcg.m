%%Probability of coverage.
function PC=pcg(THETA,kappa,w,elevation,h)
  rho=log(10)/10;
  muLoS=0*rho;
  muNLoS=-25*rho;
  sigmaLoS=4*rho;
  sigmaNLoS=6*rho;
  beta=2.3;
  pLoS=exp(-beta*cot(deg2rad(elevation)));  
  
  a = (2*exp(muNLoS+sigmaNLoS^2/2)*(-1+pLoS)-2*exp(muLoS+sigmaLoS^2/2)*pLoS)/(exp(2*(muNLoS+sigmaNLoS^2))*(-1+pLoS)-exp(2*(muLoS+sigmaLoS^2))*pLoS);
  b=(-exp(2*muNLoS+sigmaNLoS^2)*(-1+pLoS)+exp(2*(muLoS+sigmaLoS^2))*pLoS)/(2*(exp(muNLoS+sigmaNLoS^2/2)*(-1+pLoS)-exp(muLoS+sigmaLoS^2/2)*pLoS)^2);
  
  b=1/b;
  PC=[];
  beta=2.3;
  pLoS=exp(-beta*cot(deg2rad(elevation)));
  d=h/sin(deg2rad(elevation));
  alpha=4;
  

  for theta = THETA
    if w == 0
      PC = [PC theta^-(kappa*b)*hypergeom([kappa*b,kappa*b],kappa*b+1,-1/theta)];
    else
      integrand = @(v) exp(-theta*v*w*a*d^alpha)./(v.*(1+theta*v).^(kappa*b));
      PC = [PC kappa*b*integral(integrand,1,inf)];
    end 
  end
end
