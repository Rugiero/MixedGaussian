function mb=mthmomentSINR(m,b,kappa,theta,w)
  %%tic
  kns = colex(b,m,0,b);
  mb=0;
  for  iii=1:length(kns(:,1))
    if(m==1)
      mb = mb + prod(nchoosek(1:m,m).^kns(iii,:).*(-1).^(kns(iii,:).*((1:m)+1)).*pgfl(m,b,kappa,theta,kns(iii,:)))*genexpint(1+kappa,m*factorial(m)^(-1/m)*w*theta)*kappa;
    else
      binomials = [];
      for jjj=1:m
	binomials = [binomials nchoosek(m,jjj)];
      end
      mb = mb + multinomial(b,kns(iii,:))*prod(binomials.^kns(iii,:).*(-1).^(kns(iii,:).*((1:m)+1)))*pgfl(m,b,kappa,theta,kns(iii,:))*genexpint(1+kappa,iii*m*factorial(m)^(-1/m)*w*theta)*kappa;
    end
  end
  %%toc
end 

function pgfl=pgfl(m,b,kappa,theta,kns)
  alpha = m*(factorial(m)).^(-1/m);
  integrand = @(y) (1-prod((m./(m+alpha*theta*y*(1:m))).^(kns.*m)))./y;
  pgfl =  exp(-kappa*integral(integrand, 0,1,'ArrayValued',true));
end
