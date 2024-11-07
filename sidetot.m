function Pside=sidetot(LAMBDA,h,alpha)
  rE=6378;
  Xi=acos(rE/(h+rE));
  Pside = [];
  for lambda = LAMBDA
    d = @(xi) sqrt(rE^2+(rE+h)^2-2*rE*(rE+h).*cos(xi));
    varphi = @(xi) pi/2-xi-asin((cos(xi).*(rE+h)-rE)./d(xi));
    %%   integrand= @(xi) 2*pi*rE^2*lambda*ITUpattern(varphi(xi)).*sin(xi).*(ITUpattern(varphi(xi))<0.1)./d(xi).^alpha;
    %% Pside = integral(integrand,0,Xi);

    integrand= @(xi) 2*pi*rE^2*lambda*ITUpattern(varphi(xi)).*sin(xi)./d(xi).^alpha;
    dtheta = @(varphi) (h+rE)*cos(varphi)-sqrt((h+rE)^2*cos(varphi)^2-h*(h+2*rE));
    mainxi = @(varphi) acos((rE^2+(rE+h)^2-dtheta(varphi)^2)/(2*rE*(rE+h)));
%%    xi1 = mainxi(0.0565053);
    xi1=0.00957818;
%    xi1=0;
    %Pside = [Pside integral(integrand,xi1,1*Xi)];
    Pside = [Pside integral(integrand,0.1*Xi,1*Xi)];
    Pside = [Pside integral(integrand,0.1*Xi,1*Xi)];
  end
end 


function gains = ITUpattern(varphis)
  gains=[];
  varphiRX=0.0279;
  for varphi = varphis
    %%   if(abs(varphi)<=varphiRX)
    %%    gains=[gains 1];
    if(deg2rad(0)<=abs(varphi)&&abs(varphi)<=deg2rad(2.4))
      gains=[gains 10^(-3*(varphi^2/varphiRX^2)/10)];
    elseif(deg2rad(2.4)<abs(varphi) && abs(varphi) <= deg2rad(20.4))
      gains = [gains 10^(-6.75/10-25*log10(abs(varphi)/deg2rad(2.4))/10)];
    else
      gains = [gains 10^(-30/10)];
    end
  end
end
