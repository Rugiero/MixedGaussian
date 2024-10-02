function means=solveexpmeans(elevation)
  rho=log(10)/10;
  muLoS=0*rho;
  muNLoS=-12*rho;
  sigmaLoS=2.8*rho;
  %%sigmaLoS=0.001*rho;
  sigmaNLoS=9*rho;
  beta=2.3;
  pLoS=exp(-beta*cot(deg2rad(elevation)));

  mlnLoS= pLoS*exp(muLoS+sigmaLoS^2/2);
  varlnLoS=pLoS*exp(2*muLoS+2*sigmaLoS^2)/2;
  mlnNLoS=(1-pLoS)*exp(muNLoS+sigmaNLoS^2/2);
  varlnNLoS=(1-pLoS)*exp(2*muNLoS+2*sigmaNLoS^2)/2;
  varexpLoS= @(mLoS) pLoS*mLoS^2;
  varexpNLoS= @(mNLoS) (1-pLoS)*mNLoS^2;
  
  %% minfun=@(x) ((pLoS*x(1)+(1-pLoS)*x(2)-(mlnLoS+mlnNLoS))^2+...
  %%(varexpLoS(x(1))+varexpNLoS(x(2))-...
  %% (varlnLoS+varlnNLoS))^2)*(x(1)>=0)*(x(2)>=0) +10^4*(x(1)<0)+10^4*(x(2)<0);
  
%%  minfun1=@(x) (pLoS*x-mlnLoS).^2+(varexpLoS(x)-varlnLoS).^2;
 %% minfun2=@(x) ((1-pLoS)*x-mlnNLoS).^2+(varexpNLoS(x)-varlnNLoS).^2;

 %% minfun3=@(x) ((pLoS*x(1)+(1-pLoS)*x(2)-(mlnLoS+mlnNLoS)).^2+(varexpLoS(x(1))+varexpNLoS(x(2))-(varlnLoS+varlnNLoS)).^2)+1000*(x(1)<0)+1000*(x(2)<0);
 %%minfun3=@(x) ((varexpLoS(x(1))+varexpNLoS(x(2))-(varlnLoS+varlnNLoS)).^2)+1000*(x(1)<0)+1000*(x(2)<0);
 minfun3=@(x) ((pLoS*x(1)+(1-pLoS)*x(2)-(mlnLoS+mlnNLoS)).^2)+1000*(x(1)<0)+1000*(x(2)<0);
  
  means=fminsearch(minfun3,[10,10]);
  %% if(elevation==90)
  %%   means=[fminsearch(minfun1,10), 1];
  %% elseif(elevation<20)
  %%   means=[1, fminsearch(minfun2,10)];
  %% else
  %%   means=[fminsearch(minfun1,10), fminsearch(minfun2,10)];
  %% end
  
end
